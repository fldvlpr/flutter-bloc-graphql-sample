// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostListState()';
}


}

/// @nodoc
class $PostListStateCopyWith<$Res>  {
$PostListStateCopyWith(PostListState _, $Res Function(PostListState) __);
}


/// Adds pattern-matching-related methods to [PostListState].
extension PostListStatePatterns on PostListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PostListStateInitial value)?  initial,TResult Function( _PostListStateLoading value)?  loading,TResult Function( _PostListStateLoaded value)?  loaded,TResult Function( _PostListStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostListStateInitial() when initial != null:
return initial(_that);case _PostListStateLoading() when loading != null:
return loading(_that);case _PostListStateLoaded() when loaded != null:
return loaded(_that);case _PostListStateFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PostListStateInitial value)  initial,required TResult Function( _PostListStateLoading value)  loading,required TResult Function( _PostListStateLoaded value)  loaded,required TResult Function( _PostListStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case _PostListStateInitial():
return initial(_that);case _PostListStateLoading():
return loading(_that);case _PostListStateLoaded():
return loaded(_that);case _PostListStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PostListStateInitial value)?  initial,TResult? Function( _PostListStateLoading value)?  loading,TResult? Function( _PostListStateLoaded value)?  loaded,TResult? Function( _PostListStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _PostListStateInitial() when initial != null:
return initial(_that);case _PostListStateLoading() when loading != null:
return loading(_that);case _PostListStateLoaded() when loaded != null:
return loaded(_that);case _PostListStateFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Post> posts)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostListStateInitial() when initial != null:
return initial();case _PostListStateLoading() when loading != null:
return loading();case _PostListStateLoaded() when loaded != null:
return loaded(_that.posts);case _PostListStateFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Post> posts)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _PostListStateInitial():
return initial();case _PostListStateLoading():
return loading();case _PostListStateLoaded():
return loaded(_that.posts);case _PostListStateFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Post> posts)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _PostListStateInitial() when initial != null:
return initial();case _PostListStateLoading() when loading != null:
return loading();case _PostListStateLoaded() when loaded != null:
return loaded(_that.posts);case _PostListStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PostListStateInitial implements PostListState {
  const _PostListStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostListStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostListState.initial()';
}


}




/// @nodoc


class _PostListStateLoading implements PostListState {
  const _PostListStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostListStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostListState.loading()';
}


}




/// @nodoc


class _PostListStateLoaded implements PostListState {
  const _PostListStateLoaded(final  List<Post> posts): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostListStateLoadedCopyWith<_PostListStateLoaded> get copyWith => __$PostListStateLoadedCopyWithImpl<_PostListStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostListStateLoaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'PostListState.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$PostListStateLoadedCopyWith<$Res> implements $PostListStateCopyWith<$Res> {
  factory _$PostListStateLoadedCopyWith(_PostListStateLoaded value, $Res Function(_PostListStateLoaded) _then) = __$PostListStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class __$PostListStateLoadedCopyWithImpl<$Res>
    implements _$PostListStateLoadedCopyWith<$Res> {
  __$PostListStateLoadedCopyWithImpl(this._self, this._then);

  final _PostListStateLoaded _self;
  final $Res Function(_PostListStateLoaded) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(_PostListStateLoaded(
null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class _PostListStateFailure implements PostListState {
  const _PostListStateFailure(this.message);
  

 final  String message;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostListStateFailureCopyWith<_PostListStateFailure> get copyWith => __$PostListStateFailureCopyWithImpl<_PostListStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostListStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PostListState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$PostListStateFailureCopyWith<$Res> implements $PostListStateCopyWith<$Res> {
  factory _$PostListStateFailureCopyWith(_PostListStateFailure value, $Res Function(_PostListStateFailure) _then) = __$PostListStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$PostListStateFailureCopyWithImpl<$Res>
    implements _$PostListStateFailureCopyWith<$Res> {
  __$PostListStateFailureCopyWithImpl(this._self, this._then);

  final _PostListStateFailure _self;
  final $Res Function(_PostListStateFailure) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_PostListStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
