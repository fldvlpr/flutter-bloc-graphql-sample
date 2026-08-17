import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_state.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/presentation/pages/post_form_page.dart';

class MockPostFormBloc extends Mock implements PostFormBloc {}
class FakePostFormEvent extends Fake implements PostFormEvent {}

void main() {
  late MockPostFormBloc mockFormBloc;

  setUpAll(() {
    registerFallbackValue(FakePostFormEvent());
  });

  setUp(() {
    mockFormBloc = MockPostFormBloc();
    
    // Stub the stream required by flutter_bloc
    when(() => mockFormBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  // Helper function to build our widget for testing
  Widget createWidgetUnderTest({String? postId, Post? post}) {
    return MaterialApp(
      home: BlocProvider<PostFormBloc>.value(
        value: mockFormBloc,
        child: PostFormView(postId: postId, post: post),
      ),
    );
  }

  group('PostFormView Widget Tests', () {
    testWidgets('renders Create Post UI when postId is null', (tester) async {
      // ARRANGE
      when(() => mockFormBloc.state).thenReturn(const PostFormState.initial());

      // ACT
      await tester.pumpWidget(createWidgetUnderTest());

      // ASSERT
      expect(find.text('Create Post'), findsOneWidget); // AppBar title
      expect(find.text('Create'), findsOneWidget); // Submit button
    });

    testWidgets('renders Edit Post UI with pre-filled data when postId is provided', (tester) async {
      // ARRANGE
      when(() => mockFormBloc.state).thenReturn(const PostFormState.initial());
      final tPost = const Post(id: '1', title: 'Old Title', body: 'Old Body');

      // ACT
      await tester.pumpWidget(createWidgetUnderTest(postId: '1', post: tPost));

      // ASSERT
      expect(find.text('Edit Post'), findsOneWidget); // AppBar title
      expect(find.text('Update'), findsOneWidget); // Submit button
      expect(find.text('Old Title'), findsOneWidget); // Title field pre-filled
      expect(find.text('Old Body'), findsOneWidget); // Body field pre-filled
    });

    testWidgets('shows loading indicator when state is loading', (tester) async {
      // ARRANGE
      when(() => mockFormBloc.state).thenReturn(const PostFormState.loading());

      // ACT
      await tester.pumpWidget(createWidgetUnderTest());

      // ASSERT
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows validation errors when submitting empty form', (tester) async {
      // ARRANGE
      when(() => mockFormBloc.state).thenReturn(const PostFormState.initial());

      // ACT
      await tester.pumpWidget(createWidgetUnderTest()); // Render Create mode
      await tester.tap(find.text('Create')); // Tap submit without typing
      await tester.pump(); // Force UI to redraw validation errors

      // ASSERT
      expect(find.text('Title is required'), findsOneWidget);
      expect(find.text('Body is required'), findsOneWidget);
      
      // Verify no event was added to the BLoC because validation failed
      verifyNever(() => mockFormBloc.add(any()));
    });
  });
}
