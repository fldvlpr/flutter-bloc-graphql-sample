import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_state.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/repositories/post_repository.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  PostListBloc({required this.postRepository})
    : super(PostListState.initial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  final PostRepository postRepository;

  Future<void> _onFetchPosts(
    FetchPosts event,
    Emitter<PostListState> emit,
  ) async {
    emit(const PostListState.loading());

    try {
      final posts = await postRepository.getPosts(
        page: event.page,
        limit: event.limit,
      );
      emit(PostListState.loaded(posts));
    } catch (e) {
      emit(PostListState.failure(e.toString()));
    }
  }
}
