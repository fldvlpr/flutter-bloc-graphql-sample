import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_detail/post_detail_state.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_state.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/presentation/pages/post_detail_page.dart';

class MockPostDetailBloc extends Mock implements PostDetailBloc {}
class MockPostFormBloc extends Mock implements PostFormBloc {}

void main() {
  late MockPostDetailBloc mockDetailBloc;
  late MockPostFormBloc mockFormBloc;

  setUp(() {
    mockDetailBloc = MockPostDetailBloc();
    mockFormBloc = MockPostFormBloc();
    
    // 1. Stub the streams for BOTH BLoCs!
    when(() => mockDetailBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockFormBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PostDetailBloc>.value(value: mockDetailBloc),
          BlocProvider<PostFormBloc>.value(value: mockFormBloc),
        ],
        child: const PostDetailView(),
      ),
    );
  }

  group('PostDetailView Widget Tests', () {
    testWidgets('shows loading indicator when detail state is loading', (tester) async {
      // ARRANGE
      when(() => mockDetailBloc.state).thenReturn(const PostDetailState.loading());
      when(() => mockFormBloc.state).thenReturn(const PostFormState.initial());

      // ACT
      await tester.pumpWidget(createWidgetUnderTest());

      // ASSERT
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows post details when state is loaded', (tester) async {
      // ARRANGE
      final tPost = const Post(id: '1', title: 'My Title', body: 'My Body');
      when(() => mockDetailBloc.state).thenReturn(PostDetailState.loaded(tPost));
      when(() => mockFormBloc.state).thenReturn(const PostFormState.initial());

      // ACT
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // ASSERT
      expect(find.text('My Title'), findsOneWidget);
      expect(find.text('My Body'), findsOneWidget);
    });

    testWidgets('shows error message when state is failure', (tester) async {
      // ARRANGE
      when(() => mockDetailBloc.state).thenReturn(const PostDetailState.failure('Server Crash'));
      when(() => mockFormBloc.state).thenReturn(const PostFormState.initial());

      // ACT
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // ASSERT
      expect(find.text('Error: Server Crash'), findsOneWidget);
    });
  });
}
