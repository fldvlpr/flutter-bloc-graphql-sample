// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState()';
}


}

/// @nodoc
class $PostDetailStateCopyWith<$Res>  {
$PostDetailStateCopyWith(PostDetailState _, $Res Function(PostDetailState) __);
}


/// Adds pattern-matching-related methods to [PostDetailState].
extension PostDetailStatePatterns on PostDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PostDetailStateInitial value)?  initial,TResult Function( _PostDetailStateLoading value)?  loading,TResult Function( _PostDetailStateLoaded value)?  loaded,TResult Function( _PostDetailStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDetailStateInitial() when initial != null:
return initial(_that);case _PostDetailStateLoading() when loading != null:
return loading(_that);case _PostDetailStateLoaded() when loaded != null:
return loaded(_that);case _PostDetailStateFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PostDetailStateInitial value)  initial,required TResult Function( _PostDetailStateLoading value)  loading,required TResult Function( _PostDetailStateLoaded value)  loaded,required TResult Function( _PostDetailStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case _PostDetailStateInitial():
return initial(_that);case _PostDetailStateLoading():
return loading(_that);case _PostDetailStateLoaded():
return loaded(_that);case _PostDetailStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PostDetailStateInitial value)?  initial,TResult? Function( _PostDetailStateLoading value)?  loading,TResult? Function( _PostDetailStateLoaded value)?  loaded,TResult? Function( _PostDetailStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _PostDetailStateInitial() when initial != null:
return initial(_that);case _PostDetailStateLoading() when loading != null:
return loading(_that);case _PostDetailStateLoaded() when loaded != null:
return loaded(_that);case _PostDetailStateFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Post post)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostDetailStateInitial() when initial != null:
return initial();case _PostDetailStateLoading() when loading != null:
return loading();case _PostDetailStateLoaded() when loaded != null:
return loaded(_that.post);case _PostDetailStateFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Post post)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _PostDetailStateInitial():
return initial();case _PostDetailStateLoading():
return loading();case _PostDetailStateLoaded():
return loaded(_that.post);case _PostDetailStateFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Post post)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _PostDetailStateInitial() when initial != null:
return initial();case _PostDetailStateLoading() when loading != null:
return loading();case _PostDetailStateLoaded() when loaded != null:
return loaded(_that.post);case _PostDetailStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PostDetailStateInitial implements PostDetailState {
  const _PostDetailStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDetailStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.initial()';
}


}




/// @nodoc


class _PostDetailStateLoading implements PostDetailState {
  const _PostDetailStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDetailStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.loading()';
}


}




/// @nodoc


class _PostDetailStateLoaded implements PostDetailState {
  const _PostDetailStateLoaded(this.post);
  

 final  Post post;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDetailStateLoadedCopyWith<_PostDetailStateLoaded> get copyWith => __$PostDetailStateLoadedCopyWithImpl<_PostDetailStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDetailStateLoaded&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailState.loaded(post: $post)';
}


}

/// @nodoc
abstract mixin class _$PostDetailStateLoadedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory _$PostDetailStateLoadedCopyWith(_PostDetailStateLoaded value, $Res Function(_PostDetailStateLoaded) _then) = __$PostDetailStateLoadedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$PostDetailStateLoadedCopyWithImpl<$Res>
    implements _$PostDetailStateLoadedCopyWith<$Res> {
  __$PostDetailStateLoadedCopyWithImpl(this._self, this._then);

  final _PostDetailStateLoaded _self;
  final $Res Function(_PostDetailStateLoaded) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_PostDetailStateLoaded(
null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _PostDetailStateFailure implements PostDetailState {
  const _PostDetailStateFailure(this.message);
  

 final  String message;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDetailStateFailureCopyWith<_PostDetailStateFailure> get copyWith => __$PostDetailStateFailureCopyWithImpl<_PostDetailStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDetailStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PostDetailState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$PostDetailStateFailureCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory _$PostDetailStateFailureCopyWith(_PostDetailStateFailure value, $Res Function(_PostDetailStateFailure) _then) = __$PostDetailStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$PostDetailStateFailureCopyWithImpl<$Res>
    implements _$PostDetailStateFailureCopyWith<$Res> {
  __$PostDetailStateFailureCopyWithImpl(this._self, this._then);

  final _PostDetailStateFailure _self;
  final $Res Function(_PostDetailStateFailure) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_PostDetailStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
