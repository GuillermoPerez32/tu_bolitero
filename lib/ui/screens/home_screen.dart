import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/ui/logic/ad/ad_cubit.dart';
import 'package:tu_bolitero/ui/logic/apk_info/apk_info_cubit.dart';
import 'package:tu_bolitero/ui/logic/post/post_cubit.dart';
import 'package:tu_bolitero/ui/widgets/ad_modal.dart';
import 'package:tu_bolitero/ui/widgets/apk_info_modal.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';
import 'package:tu_bolitero/ui/widgets/post_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  String selectedChoice = 'Todos';

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
          return Scaffold(
            appBar: AppBar(
              title: const Text(appTitle),
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
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
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
                        children: ['Todos', 'Seguidos'].map((option) {
                          return ChoiceChip(
                            label: Text(option.toUpperCase()),
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
                      loaded: (posts, followedPosts) => Column(
                        children: selectedChoice == 'Todos'
                            ? posts.map((post) => PostTile(post: post)).toList()
                            : followedPosts
                                .map((post) => PostTile(post: post))
                                .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                postBloc.loadPosts();
              },
              child: const Icon(Icons.refresh),
            ),
          );
        },
      ),
    );
  }
}
