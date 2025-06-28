import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tu_bolitero/domain/models/post.dart';
import 'package:tu_bolitero/ui/logic/post/post_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';
import 'package:tu_bolitero/ui/widgets/comment_tile.dart';

class CommentsScreen extends StatefulWidget {
  final String postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  bool _isCommenting = false;

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostCubit>(context);
    return Scaffold(
      appBar: const BoliteroAppBar(),
      bottomNavigationBar: const BottomBar(index: 0),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(
              child: Text('Pantalla de Comentarios'),
            ),
            loading: (posts, _) => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (posts, _) {
              final Post? post = posts
                  .where((post) => post.id.toString() == widget.postId)
                  .toList()
                  .firstOrNull;

              if (post == null) {
                return const Center(
                  child: Text('Post no encontrado'),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Comentarios",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400)),
                            Text(
                              DateFormat.MMMMEEEEd().format(post.fecha),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                            ),
                          ],
                        ),
                        FilledButton(
                            onPressed: () {
                              setState(() {
                                _isCommenting = !_isCommenting;
                              });
                            },
                            child: Text(_isCommenting
                                ? 'Cancelar'
                                : 'Añadir comentario'))
                      ],
                    ),
                    if (_isCommenting)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _commentController,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.send,
                                  color: _commentController.text.isNotEmpty
                                      ? Theme.of(context).colorScheme.primary
                                      : null),
                              onPressed: () {
                                postBloc.addComment(
                                  int.parse(widget.postId),
                                  _commentController.text,
                                );
                                _commentController.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListView.builder(
                          itemCount: post.comments!.length,
                          itemBuilder: (context, index) {
                            final comment = post.comments![index];
                            return CommentTile(
                              comment: comment,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
