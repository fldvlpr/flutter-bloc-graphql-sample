import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/providers/post_provider.dart';

class PostRepository {
  final PostProvider provider;

  PostRepository({required this.provider});

  Future<List<Post>> getPosts({int page = 1, int limit = 10}) async {
    final result = await provider.getPosts(page: page, limit: limit);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    // Parse the JSON list into a List of Post models
    final data = result.data?['posts']['data'] as List?;
    if (data == null) return [];

    return data.map((json) => Post.fromJson(json)).toList();
  }

  Future<Post> getPostById(String id) async {
    final result = await provider.getPostById(id);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    // Single post — no list wrapping, just parse directly
    return Post.fromJson(result.data?['post']);
  }

  Future<Post> createPost(String title, String body) async {
    final result = await provider.createPost(title, body);

    if (result.hasException) throw Exception(result.exception.toString());

    return Post.fromJson(result.data?['createPost']);
  }

  Future<Post> updatePost(String id, String title, String body) async {
    final result = await provider.updatePost(id, title, body);

    if (result.hasException) throw Exception(result.exception.toString());

    return Post.fromJson(result.data?['updatePost']);
  }

  Future<bool> deletePost(String id) async {
    final result = await provider.deletePost(id);

    if (result.hasException) throw Exception(result.exception.toString());

    return result.data?['deletePost'] ?? false;
  }
}
