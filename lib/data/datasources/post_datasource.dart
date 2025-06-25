import 'package:tu_bolitero/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:tu_bolitero/domain/models/post.dart';
import 'package:tu_bolitero/domain/models/post_comment.dart';

class PostDatasource {
  final _client = Dio();

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
    final response = await _client.get('$host/api/posts/$id/comments');
    final data = response.data as List;
    final comments =
        data.map((comment) => PostComment.fromJson(comment)).toList();
    return comments;
  }

  Future<Post> followPost(int id) async {
    final response = await _client.post('$host/api/posts/$id/follow');
    final data = response.data as Map<String, dynamic>;
    final post = Post.fromJson(data);
    return post;
  }

  Future<Post> unfollowPost(int id) async {
    final response = await _client.delete('$host/api/posts/$id/follow');
    final data = response.data as Map<String, dynamic>;
    final post = Post.fromJson(data);
    return post;
  }

  Future<Post> likePost(int id) async {
    final response = await _client.post('$host/api/posts/$id/like');
    final data = response.data as Map<String, dynamic>;
    final post = Post.fromJson(data);
    return post;
  }

  Future<Post> unlikePost(int id) async {
    final response = await _client.delete('$host/api/posts/$id/like');
    final data = response.data as Map<String, dynamic>;
    final post = Post.fromJson(data);
    return post;
  }

  Future<List<Post>> getFollowedPosts() async {
    final response = await _client.get('$host/api/posts/following');
    final data = response.data as List;
    final posts = data.map((post) => Post.fromJson(post)).toList();
    return posts;
  }
}

final postDatasource = PostDatasource();
