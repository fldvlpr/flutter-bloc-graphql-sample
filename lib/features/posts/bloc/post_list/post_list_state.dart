import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_state.freezed.dart';

@freezed
abstract class PostListState with _$PostListState {
  const factory PostListState.initial() = _PostListStateInitial;
  const factory PostListState.loading() = _PostListStateLoading;
  const factory PostListState.loaded(List<Post> posts) = _PostListStateLoaded;
  const factory PostListState.failure(String message) = _PostListStateFailure;
}
