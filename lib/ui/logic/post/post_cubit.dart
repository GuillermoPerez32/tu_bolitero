import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/data/datasources/post_datasource.dart';
import 'package:tu_bolitero/domain/models/post.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(const PostState.initial([], []));

  void setLoading() {
    emit(PostState.loading(state.posts, state.followedPosts));
  }

  void loadPosts() async {
    emit(PostState.loading(state.posts, state.followedPosts));
    final posts = await postDatasource.getPosts();
    emit(PostState.loaded(posts, state.followedPosts));
    for (final post in posts) {
      loadPostComments(post.id);
    }
  }

  void loadPostComments(int postId) async {
    try {
      final comments = await postDatasource.getPostComments(postId);
      final newPost = state.posts
          .firstWhere((element) => element.id == postId)
          .copyWith(comments: comments);
      final editablePosts = List<Post>.from(state.posts);
      final oldPostId =
          editablePosts.indexWhere((element) => element.id == postId);
      editablePosts[oldPostId] = newPost;
      emit(
        PostState.loaded(editablePosts, state.followedPosts),
      );
    } catch (e) {
      emit(PostState.error(state.posts, state.followedPosts, e.toString()));
    }
  }

  void likePost(int postId) async {
    try {
      emit(PostState.loading(state.posts, state.followedPosts));
      await postDatasource.likePost(postId);
      emit(PostState.loaded(state.posts, state.followedPosts));
      loadPosts();
    } catch (e) {
      emit(PostState.error(state.posts, state.followedPosts, e.toString()));
    }
  }

  void loadFollowedPosts() async {
    emit(PostState.loading(state.posts, state.followedPosts));
    final posts = await postDatasource.getFollowedPosts();
    emit(PostState.loaded(state.posts, posts));
    for (final post in posts) {
      loadPostComments(post.id);
    }
  }

  void follow(int postId) async {
    try {
      await postDatasource.followPost(postId);
      final newPost = state.posts
          .firstWhere((element) => element.id == postId)
          .copyWith(following: true);
      final editablePosts = List<Post>.from(state.posts);
      final oldPostId =
          editablePosts.indexWhere((element) => element.id == postId);
      editablePosts[oldPostId] = newPost;
      emit(PostState.loaded(editablePosts, state.followedPosts));
      loadFollowedPosts();
    } catch (e) {
      emit(PostState.error(state.posts, state.followedPosts, e.toString()));
    }
  }

  void unfollow(int postId) async {
    try {
      await postDatasource.unfollowPost(postId);
      final newPost = state.posts
          .firstWhere((element) => element.id == postId)
          .copyWith(following: false);
      final editablePosts = List<Post>.from(state.posts);
      final oldPostId =
          editablePosts.indexWhere((element) => element.id == postId);
      editablePosts[oldPostId] = newPost;
      emit(PostState.loaded(editablePosts, state.followedPosts));
      loadFollowedPosts();
    } catch (e) {
      emit(PostState.error(state.posts, state.followedPosts, e.toString()));
    }
  }

  void addComment(int postId, String comment) async {
    try {
      emit(PostState.loading(state.posts, state.followedPosts));
      await postDatasource.addComment(postId, comment);
      final newPosts = state.posts.toList();
      loadPostComments(postId);
      emit(PostState.loaded(newPosts, state.followedPosts));
    } catch (e) {
      emit(PostState.error(state.posts, state.followedPosts, e.toString()));
    }
  }

  void createPost(String numbers, int lottery, DateTime? date) async {
    try {
      emit(PostState.loading(state.posts, state.followedPosts));
      await postDatasource.createPost(numbers, lottery, date);
      emit(PostState.loaded(state.posts, state.followedPosts));
    } catch (e) {
      emit(PostState.error(state.posts, state.followedPosts, e.toString()));
    }
  }
}
