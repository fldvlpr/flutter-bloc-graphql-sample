// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostListEvent {

 int get page; int get limit;
/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListEventCopyWith<PostListEvent> get copyWith => _$PostListEventCopyWithImpl<PostListEvent>(this as PostListEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListEvent&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit);

@override
String toString() {
  return 'PostListEvent(page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $PostListEventCopyWith<$Res>  {
  factory $PostListEventCopyWith(PostListEvent value, $Res Function(PostListEvent) _then) = _$PostListEventCopyWithImpl;
@useResult
$Res call({
 int page, int limit
});




}
/// @nodoc
class _$PostListEventCopyWithImpl<$Res>
    implements $PostListEventCopyWith<$Res> {
  _$PostListEventCopyWithImpl(this._self, this._then);

  final PostListEvent _self;
  final $Res Function(PostListEvent) _then;

/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PostListEvent].
extension PostListEventPatterns on PostListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchPosts value)?  fetchPosts,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchPosts() when fetchPosts != null:
return fetchPosts(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchPosts value)  fetchPosts,}){
final _that = this;
switch (_that) {
case FetchPosts():
return fetchPosts(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchPosts value)?  fetchPosts,}){
final _that = this;
switch (_that) {
case FetchPosts() when fetchPosts != null:
return fetchPosts(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page,  int limit)?  fetchPosts,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchPosts() when fetchPosts != null:
return fetchPosts(_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page,  int limit)  fetchPosts,}) {final _that = this;
switch (_that) {
case FetchPosts():
return fetchPosts(_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page,  int limit)?  fetchPosts,}) {final _that = this;
switch (_that) {
case FetchPosts() when fetchPosts != null:
return fetchPosts(_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class FetchPosts implements PostListEvent {
  const FetchPosts({this.page = 1, this.limit = 10});
  

@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;

/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchPostsCopyWith<FetchPosts> get copyWith => _$FetchPostsCopyWithImpl<FetchPosts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchPosts&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit);

@override
String toString() {
  return 'PostListEvent.fetchPosts(page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $FetchPostsCopyWith<$Res> implements $PostListEventCopyWith<$Res> {
  factory $FetchPostsCopyWith(FetchPosts value, $Res Function(FetchPosts) _then) = _$FetchPostsCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit
});




}
/// @nodoc
class _$FetchPostsCopyWithImpl<$Res>
    implements $FetchPostsCopyWith<$Res> {
  _$FetchPostsCopyWithImpl(this._self, this._then);

  final FetchPosts _self;
  final $Res Function(FetchPosts) _then;

/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,}) {
  return _then(FetchPosts(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
