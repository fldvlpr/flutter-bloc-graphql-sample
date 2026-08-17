import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_event.freezed.dart';

@freezed
abstract class PostDetailEvent with _$PostDetailEvent {
  const factory PostDetailEvent.fetchPostDetail({required String id}) =
      FetchPostDetailEvent;
}
