import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_state.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/repositories/post_repository.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc({required this.postRepository})
    : super(PostDetailState.initial()) {
    on<FetchPostDetailEvent>(onFetchPostDetail);
  }

  final PostRepository postRepository;

  Future<void> onFetchPostDetail(
    FetchPostDetailEvent event,
    Emitter<PostDetailState> emit,
  ) async {
    emit(PostDetailState.loading());
    try {
      final post = await postRepository.getPostById(event.id);
      emit(PostDetailState.loaded(post));
    } catch (e) {
      emit(PostDetailState.failure(e.toString()));
    }
  }
}
