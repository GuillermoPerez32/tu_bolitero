part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial(List<Post> posts, List<Post> followedPosts) =
      _Initial;
  const factory PostState.loading(List<Post> posts, List<Post> followedPosts) =
      _Loading;
  const factory PostState.loaded(List<Post> posts, List<Post> followedPosts) =
      _Loaded;
  const factory PostState.error(
      List<Post> posts, List<Post> followedPosts, String reason) = _Error;
}
