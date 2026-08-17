// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostFormEvent()';
}


}

/// @nodoc
class $PostFormEventCopyWith<$Res>  {
$PostFormEventCopyWith(PostFormEvent _, $Res Function(PostFormEvent) __);
}


/// Adds pattern-matching-related methods to [PostFormEvent].
extension PostFormEventPatterns on PostFormEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreatePost value)?  create,TResult Function( UpdatePost value)?  update,TResult Function( DeletePost value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreatePost() when create != null:
return create(_that);case UpdatePost() when update != null:
return update(_that);case DeletePost() when delete != null:
return delete(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreatePost value)  create,required TResult Function( UpdatePost value)  update,required TResult Function( DeletePost value)  delete,}){
final _that = this;
switch (_that) {
case CreatePost():
return create(_that);case UpdatePost():
return update(_that);case DeletePost():
return delete(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreatePost value)?  create,TResult? Function( UpdatePost value)?  update,TResult? Function( DeletePost value)?  delete,}){
final _that = this;
switch (_that) {
case CreatePost() when create != null:
return create(_that);case UpdatePost() when update != null:
return update(_that);case DeletePost() when delete != null:
return delete(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title,  String body)?  create,TResult Function( String id,  String title,  String body)?  update,TResult Function( String id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreatePost() when create != null:
return create(_that.title,_that.body);case UpdatePost() when update != null:
return update(_that.id,_that.title,_that.body);case DeletePost() when delete != null:
return delete(_that.id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title,  String body)  create,required TResult Function( String id,  String title,  String body)  update,required TResult Function( String id)  delete,}) {final _that = this;
switch (_that) {
case CreatePost():
return create(_that.title,_that.body);case UpdatePost():
return update(_that.id,_that.title,_that.body);case DeletePost():
return delete(_that.id);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title,  String body)?  create,TResult? Function( String id,  String title,  String body)?  update,TResult? Function( String id)?  delete,}) {final _that = this;
switch (_that) {
case CreatePost() when create != null:
return create(_that.title,_that.body);case UpdatePost() when update != null:
return update(_that.id,_that.title,_that.body);case DeletePost() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class CreatePost implements PostFormEvent {
  const CreatePost({required this.title, required this.body});
  

 final  String title;
 final  String body;

/// Create a copy of PostFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePostCopyWith<CreatePost> get copyWith => _$CreatePostCopyWithImpl<CreatePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePost&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,title,body);

@override
String toString() {
  return 'PostFormEvent.create(title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $CreatePostCopyWith<$Res> implements $PostFormEventCopyWith<$Res> {
  factory $CreatePostCopyWith(CreatePost value, $Res Function(CreatePost) _then) = _$CreatePostCopyWithImpl;
@useResult
$Res call({
 String title, String body
});




}
/// @nodoc
class _$CreatePostCopyWithImpl<$Res>
    implements $CreatePostCopyWith<$Res> {
  _$CreatePostCopyWithImpl(this._self, this._then);

  final CreatePost _self;
  final $Res Function(CreatePost) _then;

/// Create a copy of PostFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? body = null,}) {
  return _then(CreatePost(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdatePost implements PostFormEvent {
  const UpdatePost({required this.id, required this.title, required this.body});
  

 final  String id;
 final  String title;
 final  String body;

/// Create a copy of PostFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePostCopyWith<UpdatePost> get copyWith => _$UpdatePostCopyWithImpl<UpdatePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,body);

@override
String toString() {
  return 'PostFormEvent.update(id: $id, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $UpdatePostCopyWith<$Res> implements $PostFormEventCopyWith<$Res> {
  factory $UpdatePostCopyWith(UpdatePost value, $Res Function(UpdatePost) _then) = _$UpdatePostCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body
});




}
/// @nodoc
class _$UpdatePostCopyWithImpl<$Res>
    implements $UpdatePostCopyWith<$Res> {
  _$UpdatePostCopyWithImpl(this._self, this._then);

  final UpdatePost _self;
  final $Res Function(UpdatePost) _then;

/// Create a copy of PostFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,}) {
  return _then(UpdatePost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeletePost implements PostFormEvent {
  const DeletePost(this.id);
  

 final  String id;

/// Create a copy of PostFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePostCopyWith<DeletePost> get copyWith => _$DeletePostCopyWithImpl<DeletePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePost&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PostFormEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeletePostCopyWith<$Res> implements $PostFormEventCopyWith<$Res> {
  factory $DeletePostCopyWith(DeletePost value, $Res Function(DeletePost) _then) = _$DeletePostCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeletePostCopyWithImpl<$Res>
    implements $DeletePostCopyWith<$Res> {
  _$DeletePostCopyWithImpl(this._self, this._then);

  final DeletePost _self;
  final $Res Function(DeletePost) _then;

/// Create a copy of PostFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeletePost(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
