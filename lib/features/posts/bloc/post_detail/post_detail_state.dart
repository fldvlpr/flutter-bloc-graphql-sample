import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_state.freezed.dart';

@freezed
abstract class PostDetailState with _$PostDetailState {
  const factory PostDetailState.initial() = _PostDetailStateInitial;
  const factory PostDetailState.loading() = _PostDetailStateLoading;
  const factory PostDetailState.loaded(Post post) = _PostDetailStateLoaded;
  const factory PostDetailState.failure(String message) =
      _PostDetailStateFailure;
}
