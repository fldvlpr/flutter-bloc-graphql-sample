import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/providers/post_provider.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/repositories/post_repository.dart';

class MockPostProvider extends Mock implements PostProvider {}

void main() {
  late PostRepository repository;
  late MockPostProvider mockProvider;

  // setUp runs BEFORE every single test to give us fresh instances.
  setUp(() {
    mockProvider = MockPostProvider();

    // We pass our fake provider into the real repository! (Dependency Injection)
    repository = PostRepository(provider: mockProvider);
  });

  group('PostRepository - getPosts', () {
    // Scenario 1
    test('should return List<Post> when provider returns successful data', () async {
      // ARRANGE
      // We manually construct the GraphQL QueryResult that the provider WOULD return
      final mockQueryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        data: {
          'posts': {
            'data': [
              {'id': '1', 'title': 'Test Title', 'body': 'Test Body'},
            ],
          },
        },
      );

      // We tell our fake provider: "Whenever getPosts() is called, immediately return our mockQueryResult"
      when(
        () => mockProvider.getPosts(page: 1, limit: 10),
      ).thenAnswer((_) async => mockQueryResult);

      // ACT
      // The repository thinks it's talking to the internet, but it's actually talking to our mock
      final result = await repository.getPosts(page: 1, limit: 10);

      // ASSERT
      expect(result, isA<List<Post>>());
      expect(result.length, 1);
      expect(result.first.title, 'Test Title');

      // Crucial: Verify that the provider method was actually called exactly once!
      verify(() => mockProvider.getPosts(page: 1, limit: 10)).called(1);
    });

    // Scenario 2
    test(
      'should throw an Exception when the provider returns an error',
      () async {
        // ARRANGE
        // Create a GraphQL result that represents a failure
        final mockErrorResult = QueryResult(
          options: QueryOptions(document: gql('')),
          source: QueryResultSource.network,
          exception: OperationException(
            graphqlErrors: [const GraphQLError(message: 'Server Error')],
          ),
        );
        when(
          () => mockProvider.getPosts(page: 1, limit: 10),
        ).thenAnswer((_) async => mockErrorResult);

        // ACT & ASSERT
        // When we expect a method to crash, we pass it inside a closure () =>
        expect(
          () => repository.getPosts(page: 1, limit: 10),
          throwsA(isA<Exception>()),
        );
      },
    );
  });

  group('PostRepository - getPostById', () {
    test('should return a single Post when provider returns successful data', () async {
      // ARRANGE
      final mockQueryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        data: {
          'post': {'id': '1', 'title': 'Detail Title', 'body': 'Detail Body'}
        },
      );
      
      when(() => mockProvider.getPostById('1'))
          .thenAnswer((_) async => mockQueryResult);

      // ACT
      final result = await repository.getPostById('1');

      // ASSERT
      expect(result, isA<Post>());
      expect(result.title, 'Detail Title');
      verify(() => mockProvider.getPostById('1')).called(1);
    });

    test('should throw Exception when provider fails', () async {
      // ARRANGE
      final mockErrorResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        exception: OperationException(graphqlErrors: [const GraphQLError(message: 'Error')]),
      );
      when(() => mockProvider.getPostById('1')).thenAnswer((_) async => mockErrorResult);

      // ACT & ASSERT
      expect(() => repository.getPostById('1'), throwsA(isA<Exception>()));
    });
  });

  group('PostRepository - createPost', () {
    test('should return the created Post when provider succeeds', () async {
      // ARRANGE
      final mockQueryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        data: {
          'createPost': {'id': '2', 'title': 'New Title', 'body': 'New Body'}
        },
      );
      
      when(() => mockProvider.createPost('New Title', 'New Body'))
          .thenAnswer((_) async => mockQueryResult);

      // ACT
      final result = await repository.createPost('New Title', 'New Body');

      // ASSERT
      expect(result, isA<Post>());
      expect(result.id, '2');
      verify(() => mockProvider.createPost('New Title', 'New Body')).called(1);
    });

    test('should throw Exception when provider fails', () async {
      // ARRANGE
      final mockErrorResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        exception: OperationException(graphqlErrors: [const GraphQLError(message: 'Error')]),
      );
      when(() => mockProvider.createPost('New Title', 'New Body')).thenAnswer((_) async => mockErrorResult);

      // ACT & ASSERT
      expect(() => repository.createPost('New Title', 'New Body'), throwsA(isA<Exception>()));
    });
  });

  group('PostRepository - updatePost', () {
    test('should return the updated Post when provider succeeds', () async {
      // ARRANGE
      final mockQueryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        data: {
          'updatePost': {'id': '1', 'title': 'Updated Title', 'body': 'Updated Body'}
        },
      );
      
      when(() => mockProvider.updatePost('1', 'Updated Title', 'Updated Body'))
          .thenAnswer((_) async => mockQueryResult);

      // ACT
      final result = await repository.updatePost('1', 'Updated Title', 'Updated Body');

      // ASSERT
      expect(result, isA<Post>());
      expect(result.title, 'Updated Title');
      verify(() => mockProvider.updatePost('1', 'Updated Title', 'Updated Body')).called(1);
    });

    test('should throw Exception when provider fails', () async {
      // ARRANGE
      final mockErrorResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        exception: OperationException(graphqlErrors: [const GraphQLError(message: 'Error')]),
      );
      when(() => mockProvider.updatePost('1', 'Updated Title', 'Updated Body')).thenAnswer((_) async => mockErrorResult);

      // ACT & ASSERT
      expect(() => repository.updatePost('1', 'Updated Title', 'Updated Body'), throwsA(isA<Exception>()));
    });
  });

  group('PostRepository - deletePost', () {
    test('should return true when provider successfully deletes', () async {
      // ARRANGE
      final mockQueryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        data: {
          'deletePost': true
        },
      );
      
      when(() => mockProvider.deletePost('1'))
          .thenAnswer((_) async => mockQueryResult);

      // ACT
      final result = await repository.deletePost('1');

      // ASSERT
      expect(result, isTrue);
      verify(() => mockProvider.deletePost('1')).called(1);
    });

    test('should throw Exception when provider fails', () async {
      // ARRANGE
      final mockErrorResult = QueryResult(
        options: QueryOptions(document: gql('')),
        source: QueryResultSource.network,
        exception: OperationException(graphqlErrors: [const GraphQLError(message: 'Error')]),
      );
      when(() => mockProvider.deletePost('1')).thenAnswer((_) async => mockErrorResult);

      // ACT & ASSERT
      expect(() => repository.deletePost('1'), throwsA(isA<Exception>()));
    });
  });
}
