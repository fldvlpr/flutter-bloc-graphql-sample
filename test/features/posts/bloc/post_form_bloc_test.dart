import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/repositories/post_repository.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_state.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockPostRepository mockRepository;

  setUp(() {
    mockRepository = MockPostRepository();
  });

  group('PostFormBloc', () {
    final tPost = const Post(id: '1', title: 'Title', body: 'Body');

    // ----------------------------------------------------------------------
    // CREATE POST TESTS
    // ----------------------------------------------------------------------
    blocTest<PostFormBloc, PostFormState>(
      'emits [loading, success] when CreatePost succeeds',
      build: () {
        when(() => mockRepository.createPost('Title', 'Body'))
            .thenAnswer((_) async => tPost);
        return PostFormBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostFormEvent.create(title: 'Title', body: 'Body')),
      expect: () => [
        const PostFormState.loading(),
        PostFormState.success(tPost),
      ],
      verify: (_) {
        verify(() => mockRepository.createPost('Title', 'Body')).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<PostFormBloc, PostFormState>(
      'emits [loading, failure] when CreatePost fails',
      build: () {
        when(() => mockRepository.createPost('Title', 'Body'))
            .thenThrow(Exception('Server Crash'));
        return PostFormBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostFormEvent.create(title: 'Title', body: 'Body')),
      expect: () => [
        const PostFormState.loading(),
        const PostFormState.failure('Exception: Server Crash'),
      ],
      verify: (_) {
        verify(() => mockRepository.createPost('Title', 'Body')).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    // ----------------------------------------------------------------------
    // UPDATE POST TESTS
    // ----------------------------------------------------------------------
    blocTest<PostFormBloc, PostFormState>(
      'emits [loading, success] when UpdatePost succeeds',
      build: () {
        when(() => mockRepository.updatePost('1', 'New Title', 'New Body'))
            .thenAnswer((_) async => tPost);
        return PostFormBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostFormEvent.update(id: '1', title: 'New Title', body: 'New Body')),
      expect: () => [
        const PostFormState.loading(),
        PostFormState.success(tPost),
      ],
      verify: (_) {
        verify(() => mockRepository.updatePost('1', 'New Title', 'New Body')).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<PostFormBloc, PostFormState>(
      'emits [loading, failure] when UpdatePost fails',
      build: () {
        when(() => mockRepository.updatePost('1', 'New Title', 'New Body'))
            .thenThrow(Exception('Server Crash'));
        return PostFormBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostFormEvent.update(id: '1', title: 'New Title', body: 'New Body')),
      expect: () => [
        const PostFormState.loading(),
        const PostFormState.failure('Exception: Server Crash'),
      ],
      verify: (_) {
        verify(() => mockRepository.updatePost('1', 'New Title', 'New Body')).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    // ----------------------------------------------------------------------
    // DELETE POST TESTS
    // ----------------------------------------------------------------------
    blocTest<PostFormBloc, PostFormState>(
      'emits [loading, deleted] when DeletePost succeeds',
      build: () {
        when(() => mockRepository.deletePost('1'))
            .thenAnswer((_) async => true);
        return PostFormBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostFormEvent.delete('1')),
      expect: () => [
        const PostFormState.loading(),
        const PostFormState.deleted(),
      ],
      verify: (_) {
        verify(() => mockRepository.deletePost('1')).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<PostFormBloc, PostFormState>(
      'emits [loading, failure] when DeletePost fails',
      build: () {
        when(() => mockRepository.deletePost('1'))
            .thenThrow(Exception('Server Crash'));
        return PostFormBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostFormEvent.delete('1')),
      expect: () => [
        const PostFormState.loading(),
        const PostFormState.failure('Exception: Server Crash'),
      ],
      verify: (_) {
        verify(() => mockRepository.deletePost('1')).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
