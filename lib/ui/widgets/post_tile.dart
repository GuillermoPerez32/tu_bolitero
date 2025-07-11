import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tu_bolitero/domain/models/post.dart';
import 'package:tu_bolitero/ui/logic/post/post_cubit.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final postCubit = BlocProvider.of<PostCubit>(context);

    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        final isFollowing =
            state.followedPosts.any((p) => p.user.id == post.user.id);
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                post.user.photo != ''
                    ? CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(post.user.photo!),
                      )
                    : const CircleAvatar(
                        child: Icon(Icons.person_rounded),
                      ),
                const SizedBox(width: 10),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            post.user.username,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            DateFormat('dd/MM/yyyy').format(post.fecha),
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Predicciones:",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: post.numbers.split(',').map((char) {
                          return PredictionBall(char: char);
                        }).toList(),
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              postCubit.likePost(post.id);
                            },
                            icon: Icon(Icons.favorite_outline_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                            label: Text(
                              '${post.likesCount}',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              postCubit.loadPostComments(post.id);
                              context.go('/posts/${post.id}/comments');
                            },
                            icon: Icon(Icons.chat_outlined,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                            label: Text(
                              '${post.commentsCount}',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(post.lottery),
                    ],
                  ),
                ),
                const Spacer(),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    if (isFollowing) {
                      postCubit.unfollow(post.id);
                    } else {
                      postCubit.follow(post.id);
                    }
                  },
                  child: Text(
                    isFollowing ? 'Siguiendo' : 'Seguir',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PredictionBall extends StatelessWidget {
  const PredictionBall({
    super.key,
    required this.char,
  });

  final String char;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Center(
        child: Text(
          char.padLeft(2, '0'),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
