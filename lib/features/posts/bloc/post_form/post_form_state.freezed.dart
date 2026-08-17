// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostFormState()';
}


}

/// @nodoc
class $PostFormStateCopyWith<$Res>  {
$PostFormStateCopyWith(PostFormState _, $Res Function(PostFormState) __);
}


/// Adds pattern-matching-related methods to [PostFormState].
extension PostFormStatePatterns on PostFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PostFormInitial value)?  initial,TResult Function( _PostFormLoading value)?  loading,TResult Function( _PostFormSuccess value)?  success,TResult Function( _PostFormDeleted value)?  deleted,TResult Function( _PostFormFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostFormInitial() when initial != null:
return initial(_that);case _PostFormLoading() when loading != null:
return loading(_that);case _PostFormSuccess() when success != null:
return success(_that);case _PostFormDeleted() when deleted != null:
return deleted(_that);case _PostFormFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PostFormInitial value)  initial,required TResult Function( _PostFormLoading value)  loading,required TResult Function( _PostFormSuccess value)  success,required TResult Function( _PostFormDeleted value)  deleted,required TResult Function( _PostFormFailure value)  failure,}){
final _that = this;
switch (_that) {
case _PostFormInitial():
return initial(_that);case _PostFormLoading():
return loading(_that);case _PostFormSuccess():
return success(_that);case _PostFormDeleted():
return deleted(_that);case _PostFormFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PostFormInitial value)?  initial,TResult? Function( _PostFormLoading value)?  loading,TResult? Function( _PostFormSuccess value)?  success,TResult? Function( _PostFormDeleted value)?  deleted,TResult? Function( _PostFormFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _PostFormInitial() when initial != null:
return initial(_that);case _PostFormLoading() when loading != null:
return loading(_that);case _PostFormSuccess() when success != null:
return success(_that);case _PostFormDeleted() when deleted != null:
return deleted(_that);case _PostFormFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Post? post)?  success,TResult Function()?  deleted,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostFormInitial() when initial != null:
return initial();case _PostFormLoading() when loading != null:
return loading();case _PostFormSuccess() when success != null:
return success(_that.post);case _PostFormDeleted() when deleted != null:
return deleted();case _PostFormFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Post? post)  success,required TResult Function()  deleted,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _PostFormInitial():
return initial();case _PostFormLoading():
return loading();case _PostFormSuccess():
return success(_that.post);case _PostFormDeleted():
return deleted();case _PostFormFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Post? post)?  success,TResult? Function()?  deleted,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _PostFormInitial() when initial != null:
return initial();case _PostFormLoading() when loading != null:
return loading();case _PostFormSuccess() when success != null:
return success(_that.post);case _PostFormDeleted() when deleted != null:
return deleted();case _PostFormFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PostFormInitial implements PostFormState {
  const _PostFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostFormState.initial()';
}


}




/// @nodoc


class _PostFormLoading implements PostFormState {
  const _PostFormLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostFormState.loading()';
}


}




/// @nodoc


class _PostFormSuccess implements PostFormState {
  const _PostFormSuccess(this.post);
  

 final  Post? post;

/// Create a copy of PostFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostFormSuccessCopyWith<_PostFormSuccess> get copyWith => __$PostFormSuccessCopyWithImpl<_PostFormSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostFormSuccess&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostFormState.success(post: $post)';
}


}

/// @nodoc
abstract mixin class _$PostFormSuccessCopyWith<$Res> implements $PostFormStateCopyWith<$Res> {
  factory _$PostFormSuccessCopyWith(_PostFormSuccess value, $Res Function(_PostFormSuccess) _then) = __$PostFormSuccessCopyWithImpl;
@useResult
$Res call({
 Post? post
});


$PostCopyWith<$Res>? get post;

}
/// @nodoc
class __$PostFormSuccessCopyWithImpl<$Res>
    implements _$PostFormSuccessCopyWith<$Res> {
  __$PostFormSuccessCopyWithImpl(this._self, this._then);

  final _PostFormSuccess _self;
  final $Res Function(_PostFormSuccess) _then;

/// Create a copy of PostFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = freezed,}) {
  return _then(_PostFormSuccess(
freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,
  ));
}

/// Create a copy of PostFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _PostFormDeleted implements PostFormState {
  const _PostFormDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostFormDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostFormState.deleted()';
}


}




/// @nodoc


class _PostFormFailure implements PostFormState {
  const _PostFormFailure(this.message);
  

 final  String message;

/// Create a copy of PostFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostFormFailureCopyWith<_PostFormFailure> get copyWith => __$PostFormFailureCopyWithImpl<_PostFormFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostFormFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PostFormState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$PostFormFailureCopyWith<$Res> implements $PostFormStateCopyWith<$Res> {
  factory _$PostFormFailureCopyWith(_PostFormFailure value, $Res Function(_PostFormFailure) _then) = __$PostFormFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$PostFormFailureCopyWithImpl<$Res>
    implements _$PostFormFailureCopyWith<$Res> {
  __$PostFormFailureCopyWithImpl(this._self, this._then);

  final _PostFormFailure _self;
  final $Res Function(_PostFormFailure) _then;

/// Create a copy of PostFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_PostFormFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
