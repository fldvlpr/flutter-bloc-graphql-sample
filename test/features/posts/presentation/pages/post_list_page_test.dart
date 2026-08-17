import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_list/post_list_state.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/presentation/pages/post_list_page.dart';

// 1. Dependency Rule: The UI depends on the BLoC, so we mock the BLoC!
class MockPostListBloc extends Mock implements PostListBloc {}

void main() {
  late MockPostListBloc mockBloc;

  setUp(() {
    mockBloc = MockPostListBloc();
    // We must stub the stream to return an empty stream because flutter_bloc expects it
    when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  // A helper function to wrap our widget in a MaterialApp and provide the mocked BLoC
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<PostListBloc>.value(
        value: mockBloc,
        child: const PostListView(), // We test the View, because the Page creates its own real BLoC!
      ),
    );
  }

  group('PostListPage Widget Tests', () {
    testWidgets('shows CircularProgressIndicator when state is loading', (tester) async {
      // ARRANGE: Force the BLoC to pretend it is currently loading
      when(() => mockBloc.state).thenReturn(const PostListState.loading());

      // ACT: Build the UI
      await tester.pumpWidget(createWidgetUnderTest());

      // ASSERT: Search the screen for a loading spinner
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows list of posts when state is loaded', (tester) async {
      // ARRANGE: Force the BLoC to pretend it has successfully loaded data
      final tPosts = [const Post(id: '1', title: 'Test Title 1', body: 'Body 1')];
      when(() => mockBloc.state).thenReturn(PostListState.loaded(tPosts));

      // ACT: Build the UI
      await tester.pumpWidget(createWidgetUnderTest());
      // pumpAndSettle waits for any animations (like list views rendering) to finish
      await tester.pumpAndSettle();

      // ASSERT: Check that our fake data is visible on the screen
      expect(find.text('Test Title 1'), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('shows error message when state is failure', (tester) async {
      // ARRANGE: Force the BLoC to pretend a server crash happened
      when(() => mockBloc.state).thenReturn(const PostListState.failure('Server Crash'));

      // ACT: Build the UI
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // ASSERT: Ensure the error message is shown to the user
      expect(find.text('Error: Server Crash'), findsOneWidget);
    });
  });
}
