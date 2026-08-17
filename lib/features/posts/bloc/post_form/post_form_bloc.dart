import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_state.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/repositories/post_repository.dart';

class PostFormBloc extends Bloc<PostFormEvent, PostFormState> {
  PostFormBloc({required this.postRepository})
    : super(PostFormState.initial()) {
    on<CreatePost>(_onCreatePost);
    on<UpdatePost>(_onUpdatePost);
    on<DeletePost>(_onDeletePost);
  }

  final PostRepository postRepository;

  Future<void> _onCreatePost(
    CreatePost event,
    Emitter<PostFormState> emit,
  ) async {
    emit(PostFormState.loading());
    try {
      final post = await postRepository.createPost(event.title, event.body);
      emit(PostFormState.success(post));
    } catch (e) {
      emit(PostFormState.failure(e.toString()));
    }
  }

  Future<void> _onUpdatePost(
    UpdatePost event,
    Emitter<PostFormState> emit,
  ) async {
    emit(PostFormState.loading());
    try {
      final post = await postRepository.updatePost(event.id, event.title, event.body);
      emit(PostFormState.success(post));
    } catch (e) {
      emit(PostFormState.failure(e.toString()));
    }
  }

  Future<void> _onDeletePost(
    DeletePost event,
    Emitter<PostFormState> emit,
  ) async {
    emit(PostFormState.loading());
    try {
      await postRepository.deletePost(event.id);
      emit(PostFormState.deleted());
    } catch (e) {
      emit(PostFormState.failure(e.toString()));
    }
  }
}
