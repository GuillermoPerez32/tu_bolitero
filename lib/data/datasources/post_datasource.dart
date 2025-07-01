import 'package:tu_bolitero/core/api.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:tu_bolitero/domain/models/post.dart';
import 'package:tu_bolitero/domain/models/post_comment.dart';

class PostDatasource {
  final _client = Dio();

  PostDatasource() {
    _client.interceptors.add(AuthInterceptor());
  }

  Future<List<Post>> getPosts() async {
    final response = await _client.get('$host/api/posts');
    final data = response.data as List;
    final posts = data.map((post) => Post.fromJson(post)).toList();
    return posts;
  }

  Future<Post> getPost(int id) async {
    final response = await _client.get('$host/api/posts/$id');
    final data = response.data as Map<String, dynamic>;
    final post = Post.fromJson(data);
    return post;
  }

  Future<List<PostComment>> getPostComments(int id) async {
    try {
      final response = await _client.get('$host/api/posts/$id/comments');
      final data = response.data as List;
      final comments =
          data.map((comment) => PostComment.fromJson(comment)).toList();
      return comments;
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> followPost(int id) async {
    try {
      await _client.post('$host/api/posts/$id/follow/');
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> unfollowPost(int id) async {
    try {
      await _client.post('$host/api/posts/$id/unfollow/');
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> likePost(int id) async {
    try {
      await _client.post('$host/api/posts/$id/like/');
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> unlikePost(int id) async {
    try {
      await _client.post('$host/api/posts/$id/unlike');
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<List<Post>> getFollowedPosts() async {
    final response = await _client.get('$host/api/posts/following');
    final data = response.data as List;
    final posts = data.map((post) => Post.fromJson(post)).toList();
    return posts;
  }

  Future<void> addComment(int postId, String comment) async {
    try {
      await _client
          .post('$host/api/posts/$postId/comment/', data: {'comment': comment});
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }

  Future<void> createPost(String numbers) async {
    try {
      await _client.post('$host/api/posts/', data: {'numbers': numbers});
    } on DioException catch (e) {
      final message = parseDjangoErrorMessage(e);
      throw Exception(message);
    }
  }
}

final postDatasource = PostDatasource();
