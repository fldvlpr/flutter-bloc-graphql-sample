import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/presentation/pages/post_detail_page.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/presentation/pages/post_form_page.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/presentation/pages/post_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Post List Screen
      GoRoute(
        path: '/',
        name: 'postList',
        builder: (context, state) => const PostListPage(),
      ),

      // Post Form — shared for Create & Edit
      // id is passed as a query parameter: /post/form?id=5
      // No id means Create mode, id present means Edit mode
      GoRoute(
        path: '/post/form',
        name: 'postForm',
        builder: (context, state) {
          final id = state.uri.queryParameters['id'];
          final post = state.extra as Post?;

          return PostFormPage(postId: id, post: post);
        },
      ),

      // Post Detail Screen (receives id from URL)
      GoRoute(
        path: '/post/:id',
        name: 'postDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PostDetailPage(postId: id);
        },
      ),
    ],
  );
}
