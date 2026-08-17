import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_event.freezed.dart';

@freezed
abstract class PostListEvent with _$PostListEvent {
  const factory PostListEvent.fetchPosts({
    @Default(1) int page,
    @Default(10) int limit,
  }) = FetchPosts;
}
