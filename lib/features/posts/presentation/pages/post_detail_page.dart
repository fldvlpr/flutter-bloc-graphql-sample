import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_graphql_sample/core/di/injection.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_state.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_state.dart';

class PostDetailPage extends StatelessWidget {
  final String postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              PostDetailBloc(postRepository: getIt())
                ..add(PostDetailEvent.fetchPostDetail(id: postId)),
        ),
        // We need PostFormBloc here for the delete action
        BlocProvider(create: (_) => PostFormBloc(postRepository: getIt())),
      ],
      child: const PostDetailView(),
    );
  }
}

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostFormBloc, PostFormState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          success: (_) {},
          deleted: () {
            // After delete, go back to list
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Post deleted successfully')),
            );
            context.pop();
          },
          failure: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $message')));
          },
        );
      },
      child: BlocBuilder<PostDetailBloc, PostDetailState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Scaffold(),
            loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
            loaded: (post) => Scaffold(
              appBar: AppBar(
                title: const Text('Post Detail'),
                actions: [
                  // Edit button
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => context.pushNamed(
                      'postForm',
                      queryParameters: {'id': post.id ?? ''},
                      extra: post,
                    ),
                  ),
                  // Delete button
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<PostFormBloc>().add(
                        PostFormEvent.delete(post.id ?? ''),
                      );
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title ?? '',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      post.body ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            failure: (message) => Scaffold(
              appBar: AppBar(title: const Text('Post Detail')),
              body: Center(child: Text('Error: $message')),
            ),
          );
        },
      ),
    );
  }
}
