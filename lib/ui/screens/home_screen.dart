import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/domain/models/post.dart';
import 'package:tu_bolitero/ui/logic/ad/ad_cubit.dart';
import 'package:tu_bolitero/ui/logic/apk_info/apk_info_cubit.dart';
import 'package:tu_bolitero/ui/logic/auth/auth_cubit.dart';
import 'package:tu_bolitero/ui/logic/post/post_cubit.dart';
import 'package:tu_bolitero/ui/widgets/ad_modal.dart';
import 'package:tu_bolitero/ui/widgets/apk_info_modal.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';
import 'package:tu_bolitero/ui/widgets/number_chips_input.dart';
import 'package:tu_bolitero/ui/widgets/post_tile.dart';

enum PostType { todos, seguidos }

final labels = {
  PostType.todos: 'Todos',
  PostType.seguidos: 'Seguidos',
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Post> filteredPosts = [];

  PostType selectedChoice = PostType.todos;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final postBloc = BlocProvider.of<PostCubit>(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<AdCubit, AdState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (ad) {
                showDialog(
                  context: context,
                  builder: (context) => AdModal(screenSize: screenSize, ad: ad),
                );
              },
            );
          },
        ),
        BlocListener<ApkInfoCubit, ApkInfoState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                newVersion: (apkInfo) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        ApkInfoModal(screenSize: screenSize, apkInfo: apkInfo),
                  );
                });
          },
        ),
      ],
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          final selectedPosts = selectedChoice == PostType.todos
              ? state.posts
              : state.followedPosts;

          final posts =
              _searchController.text.isEmpty ? selectedPosts : filteredPosts;

          return Scaffold(
            appBar: const BoliteroAppBar(
              title: Text("Predicciones"),
            ),
            bottomNavigationBar: const BottomBar(index: 0),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        filteredPosts = selectedPosts
                            .where((post) =>
                                post.numbers
                                    .toLowerCase()
                                    .contains(value.toLowerCase()) ||
                                post.user.username
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                            .toList();
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide.none,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Buscar',
                        filled: true,
                        prefixIcon: const Icon(Icons.search_rounded),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear_rounded),
                                onPressed: () {
                                  _searchController.clear();
                                },
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Wrap(
                        spacing: 8,
                        children: PostType.values.map((option) {
                          return ChoiceChip(
                            label: Text(labels[option]!),
                            selected: selectedChoice == option,
                            onSelected: (_) => {
                              setState(() {
                                selectedChoice = option;
                              })
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    state.maybeWhen(
                      orElse: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (posts, followedPosts, error) =>
                          Center(child: Text(error)),
                      loaded: (_, followedPosts) => Column(
                        children:
                            posts.map((post) => PostTile(post: post)).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loaded: (userData) {
                        return userData.esPronosticador || userData.isSuperuser
                            ? FloatingActionButton(
                                heroTag: 'add',
                                onPressed: () =>
                                    _openNumberInputSheet(context, postBloc),
                                child: const Icon(Icons.add_rounded),
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 8),
                    FloatingActionButton(
                      heroTag: 'refresh',
                      onPressed: () {
                        if (selectedChoice == PostType.todos) {
                          postBloc.loadPosts();
                        } else {
                          postBloc.loadFollowedPosts();
                        }
                      },
                      child: const Icon(Icons.refresh_rounded),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _openNumberInputSheet(BuildContext context, PostCubit postBloc) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: NumberChipInput(
            onSubmitted: (numbers) {
              postBloc.createPost(numbers.join(','));
            },
          ),
        );
      },
    );
  }
}
