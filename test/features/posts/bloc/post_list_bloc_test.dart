import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/repositories/post_repository.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_state.dart';

// 1. Dependency Rule: The BLoC depends on the Repository, so we mock the Repository!
class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockPostRepository mockRepository;

  // We only need to set up the mock here. 
  // blocTest handles creating and closing the bloc for us!
  setUp(() {
    mockRepository = MockPostRepository();
  });

  group('PostListBloc', () {
    // We create a dummy list of posts to use in our tests
    final tPosts = [const Post(id: '1', title: 'Test', body: 'Body')];

    // Scenario 1: Happy Path
    blocTest<PostListBloc, PostListState>(
      'emits [loading, loaded] when FetchPosts is added and repository succeeds',
      // ARRANGE
      build: () {
        when(() => mockRepository.getPosts(page: 1, limit: 10))
            .thenAnswer((_) async => tPosts);
        
        return PostListBloc(postRepository: mockRepository);
      },
      // ACT
      act: (bloc) => bloc.add(const PostListEvent.fetchPosts()),
      // ASSERT
      expect: () => [
        const PostListState.loading(),
        PostListState.loaded(tPosts),
      ],
      verify: (_) {
        verify(() => mockRepository.getPosts(page: 1, limit: 10)).called(1);
        verifyNoMoreInteractions(mockRepository);
      }
    );

    // Scenario 2: Sad Path
    blocTest<PostListBloc, PostListState>(
      'emits [loading, failure] when FetchPosts is added and repository fails',
      build: () {
        when(() => mockRepository.getPosts(page: 1, limit: 10))
            .thenThrow(Exception('Server Error'));
            
        return PostListBloc(postRepository: mockRepository);
      },
      act: (bloc) => bloc.add(const PostListEvent.fetchPosts()),
      expect: () => [
        const PostListState.loading(),
        const PostListState.failure('Exception: Server Error'),
      ],
      verify: (_) {
        verify(() => mockRepository.getPosts(page: 1, limit: 10)).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
