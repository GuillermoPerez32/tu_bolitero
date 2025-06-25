// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostState {
  List<Post> get posts => throw _privateConstructorUsedError;
  List<Post> get followedPosts => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        initial,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loading,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loaded,
    required TResult Function(
            List<Post> posts, List<Post> followedPosts, String reason)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult? Function(
            List<Post> posts, List<Post> followedPosts, String reason)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult Function(List<Post> posts, List<Post> followedPosts, String reason)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostStateCopyWith<PostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
  @useResult
  $Res call({List<Post> posts, List<Post> followedPosts});
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? followedPosts = null,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      followedPosts: null == followedPosts
          ? _value.followedPosts
          : followedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $PostStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> posts, List<Post> followedPosts});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? followedPosts = null,
  }) {
    return _then(_$InitialImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      null == followedPosts
          ? _value._followedPosts
          : followedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(final List<Post> posts, final List<Post> followedPosts)
      : _posts = posts,
        _followedPosts = followedPosts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  final List<Post> _followedPosts;
  @override
  List<Post> get followedPosts {
    if (_followedPosts is EqualUnmodifiableListView) return _followedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followedPosts);
  }

  @override
  String toString() {
    return 'PostState.initial(posts: $posts, followedPosts: $followedPosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality()
                .equals(other._followedPosts, _followedPosts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(_followedPosts));

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        initial,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loading,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loaded,
    required TResult Function(
            List<Post> posts, List<Post> followedPosts, String reason)
        error,
  }) {
    return initial(posts, followedPosts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult? Function(
            List<Post> posts, List<Post> followedPosts, String reason)?
        error,
  }) {
    return initial?.call(posts, followedPosts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult Function(List<Post> posts, List<Post> followedPosts, String reason)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(posts, followedPosts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostState {
  const factory _Initial(
      final List<Post> posts, final List<Post> followedPosts) = _$InitialImpl;

  @override
  List<Post> get posts;
  @override
  List<Post> get followedPosts;

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $PostStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> posts, List<Post> followedPosts});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? followedPosts = null,
  }) {
    return _then(_$LoadingImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      null == followedPosts
          ? _value._followedPosts
          : followedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(final List<Post> posts, final List<Post> followedPosts)
      : _posts = posts,
        _followedPosts = followedPosts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  final List<Post> _followedPosts;
  @override
  List<Post> get followedPosts {
    if (_followedPosts is EqualUnmodifiableListView) return _followedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followedPosts);
  }

  @override
  String toString() {
    return 'PostState.loading(posts: $posts, followedPosts: $followedPosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality()
                .equals(other._followedPosts, _followedPosts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(_followedPosts));

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        initial,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loading,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loaded,
    required TResult Function(
            List<Post> posts, List<Post> followedPosts, String reason)
        error,
  }) {
    return loading(posts, followedPosts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult? Function(
            List<Post> posts, List<Post> followedPosts, String reason)?
        error,
  }) {
    return loading?.call(posts, followedPosts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult Function(List<Post> posts, List<Post> followedPosts, String reason)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(posts, followedPosts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostState {
  const factory _Loading(
      final List<Post> posts, final List<Post> followedPosts) = _$LoadingImpl;

  @override
  List<Post> get posts;
  @override
  List<Post> get followedPosts;

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> posts, List<Post> followedPosts});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? followedPosts = null,
  }) {
    return _then(_$LoadedImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      null == followedPosts
          ? _value._followedPosts
          : followedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<Post> posts, final List<Post> followedPosts)
      : _posts = posts,
        _followedPosts = followedPosts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  final List<Post> _followedPosts;
  @override
  List<Post> get followedPosts {
    if (_followedPosts is EqualUnmodifiableListView) return _followedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followedPosts);
  }

  @override
  String toString() {
    return 'PostState.loaded(posts: $posts, followedPosts: $followedPosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality()
                .equals(other._followedPosts, _followedPosts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(_followedPosts));

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        initial,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loading,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loaded,
    required TResult Function(
            List<Post> posts, List<Post> followedPosts, String reason)
        error,
  }) {
    return loaded(posts, followedPosts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult? Function(
            List<Post> posts, List<Post> followedPosts, String reason)?
        error,
  }) {
    return loaded?.call(posts, followedPosts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult Function(List<Post> posts, List<Post> followedPosts, String reason)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(posts, followedPosts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PostState {
  const factory _Loaded(
      final List<Post> posts, final List<Post> followedPosts) = _$LoadedImpl;

  @override
  List<Post> get posts;
  @override
  List<Post> get followedPosts;

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> posts, List<Post> followedPosts, String reason});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? followedPosts = null,
    Object? reason = null,
  }) {
    return _then(_$ErrorImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      null == followedPosts
          ? _value._followedPosts
          : followedPosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(
      final List<Post> posts, final List<Post> followedPosts, this.reason)
      : _posts = posts,
        _followedPosts = followedPosts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  final List<Post> _followedPosts;
  @override
  List<Post> get followedPosts {
    if (_followedPosts is EqualUnmodifiableListView) return _followedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followedPosts);
  }

  @override
  final String reason;

  @override
  String toString() {
    return 'PostState.error(posts: $posts, followedPosts: $followedPosts, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality()
                .equals(other._followedPosts, _followedPosts) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(_followedPosts),
      reason);

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        initial,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loading,
    required TResult Function(List<Post> posts, List<Post> followedPosts)
        loaded,
    required TResult Function(
            List<Post> posts, List<Post> followedPosts, String reason)
        error,
  }) {
    return error(posts, followedPosts, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult? Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult? Function(
            List<Post> posts, List<Post> followedPosts, String reason)?
        error,
  }) {
    return error?.call(posts, followedPosts, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Post> posts, List<Post> followedPosts)? initial,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loading,
    TResult Function(List<Post> posts, List<Post> followedPosts)? loaded,
    TResult Function(List<Post> posts, List<Post> followedPosts, String reason)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(posts, followedPosts, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PostState {
  const factory _Error(final List<Post> posts, final List<Post> followedPosts,
      final String reason) = _$ErrorImpl;

  @override
  List<Post> get posts;
  @override
  List<Post> get followedPosts;
  String get reason;

  /// Create a copy of PostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
