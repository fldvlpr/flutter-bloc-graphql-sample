import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_form_event.freezed.dart';

@freezed
abstract class PostFormEvent with _$PostFormEvent {
  const factory PostFormEvent.create({
    required String title,
    required String body,
  }) = CreatePost;

  const factory PostFormEvent.update({
    required String id,
    required String title,
    required String body,
  }) = UpdatePost;
  
  const factory PostFormEvent.delete(String id) = DeletePost;
}
