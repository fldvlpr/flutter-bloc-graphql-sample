import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_form_state.freezed.dart';

@freezed
abstract class PostFormState with _$PostFormState {
  const factory PostFormState.initial() = _PostFormInitial;
  const factory PostFormState.loading() = _PostFormLoading;
  const factory PostFormState.success(Post? post) = _PostFormSuccess;
  const factory PostFormState.deleted() = _PostFormDeleted;
  const factory PostFormState.failure(String message) = _PostFormFailure;
}
