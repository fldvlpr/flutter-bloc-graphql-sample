import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_graphql_sample/core/di/injection.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_state.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostListBloc(postRepository: getIt())
        ..add(const PostListEvent.fetchPosts()),
      child: const PostListView(),
    );
  }
}

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('postForm'),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<PostListBloc, PostListState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (posts) => ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title ?? ''),
                  subtitle: Text(
                    post.body ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => context.pushNamed(
                    'postDetail',
                    pathParameters: {'id': post.id ?? ''},
                  ),
                );
              },
            ),
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context
                        .read<PostListBloc>()
                        .add(const PostListEvent.fetchPosts()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
