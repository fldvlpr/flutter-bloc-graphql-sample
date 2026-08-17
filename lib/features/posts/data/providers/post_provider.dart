import 'package:graphql_flutter/graphql_flutter.dart';

class PostProvider {
  final GraphQLClient client;

  PostProvider({required this.client});

  static final String _getPostsQuery = r'''
    query GetPosts($page: Int, $limit: Int) {
        posts(options: { paginate: { page: $page, limit: $limit}}) {
          data {
            id
            title
            body
          }
        }
      }
  ''';

  static final String _getPostByIdQuery = r'''
    query GetPost($id: ID!) {
      post(id: $id) {
        id
        title
        body
      }
    }
  ''';

  static final String _createPostMutation = r'''
    mutation CreatePost(input: CreatePostInput!) {
        createPost(input: $input) {
            id
            title
            body
        }
      }
  ''';

  static final String _updatePostMutation = r'''
    mutation UpdatePost($id: ID!, $input: UpdatePostInput!) {
        updatePost(id: $id, input: $input) {
            id
            title
            body
        }
      }
  ''';

  static final String _deletePostMutation = r'''
    mutation DeletePost($id: ID!) {
      deletePost(id: $id)
    }
  ''';

  Future<QueryResult> getPosts({int page = 1, int limit = 10}) async {
    final opions = QueryOptions(
      document: gql(_getPostsQuery),
      variables: {'page': page, 'limit': limit},
    );

    return await client.query(opions);
  }

  Future<QueryResult> getPostById(String id) async {
    final options = QueryOptions(
      document: gql(_getPostByIdQuery),
      variables: {'id': id},
    );
    return await client.query(options);
  }

  Future<QueryResult> createPost(String title, String body) async {
    final options = MutationOptions(
      document: gql(_createPostMutation),
      variables: {
        'input': {'title': title, 'body': body},
      },
    );

    return await client.mutate(options);
  }

  Future<QueryResult> updatePost(String id, String title, String body) async {
    final options = MutationOptions(
      document: gql(_updatePostMutation),
      variables: {
        'id': id,
        'input': {'title': title, 'body': body},
      },
    );

    return await client.mutate(options);
  }

  Future<QueryResult> deletePost(String id) async {
    final options = MutationOptions(
      document: gql(_deletePostMutation),
      variables: {'id': id},
    );
    return await client.mutate(options);
  }
}
