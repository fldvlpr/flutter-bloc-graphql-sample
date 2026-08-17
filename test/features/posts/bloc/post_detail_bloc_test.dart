import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/repositories/post_repository.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_state.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockPostRepository mockRepository;

  setUp(() {
    mockRepository = MockPostRepository();
  });

  group('PostDetailBloc', () {
    final tPost = const Post(id: '1', title: 'Detail Title', body: 'Detail Body');

    // Scenario 1: Happy Path
    blocTest<PostDetailBloc, PostDetailState>(
      'emits [loading, loaded] when FetchPostDetail is added and repository succeeds',
      build: () {
        when(() => mockRepository.getPostById('1'))
            .thenAnswer((_) async => tPost);
        return PostDetailBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostDetailEvent.fetchPostDetail(id: '1')),
      expect: () => [
        const PostDetailState.loading(),
        PostDetailState.loaded(tPost),
      ],
      verify: (_) {
        verify(() => mockRepository.getPostById('1')).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    // Scenario 2: Sad Path (Failure)
    blocTest<PostDetailBloc, PostDetailState>(
      'emits [loading, failure] when FetchPostDetail is added and repository fails',
      build: () {
        when(() => mockRepository.getPostById('1'))
            .thenThrow(Exception('Server Crash'));
        return PostDetailBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostDetailEvent.fetchPostDetail(id: '1')),
      expect: () => [
        const PostDetailState.loading(),
        const PostDetailState.failure('Exception: Server Crash'),
      ],
      verify: (_) {
        verify(() => mockRepository.getPostById('1')).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
