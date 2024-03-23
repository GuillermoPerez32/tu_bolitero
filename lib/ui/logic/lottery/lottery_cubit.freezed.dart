// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lottery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LotteryState {
  List<Lottery> get lotteries => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Lottery> lotteries) initial,
    required TResult Function(List<Lottery> lotteries) loading,
    required TResult Function(List<Lottery> lotteries) loaded,
    required TResult Function(List<Lottery> lotteries, String reason) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Lottery> lotteries)? initial,
    TResult? Function(List<Lottery> lotteries)? loading,
    TResult? Function(List<Lottery> lotteries)? loaded,
    TResult? Function(List<Lottery> lotteries, String reason)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Lottery> lotteries)? initial,
    TResult Function(List<Lottery> lotteries)? loading,
    TResult Function(List<Lottery> lotteries)? loaded,
    TResult Function(List<Lottery> lotteries, String reason)? error,
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

  @JsonKey(ignore: true)
  $LotteryStateCopyWith<LotteryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LotteryStateCopyWith<$Res> {
  factory $LotteryStateCopyWith(
          LotteryState value, $Res Function(LotteryState) then) =
      _$LotteryStateCopyWithImpl<$Res, LotteryState>;
  @useResult
  $Res call({List<Lottery> lotteries});
}

/// @nodoc
class _$LotteryStateCopyWithImpl<$Res, $Val extends LotteryState>
    implements $LotteryStateCopyWith<$Res> {
  _$LotteryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lotteries = null,
  }) {
    return _then(_value.copyWith(
      lotteries: null == lotteries
          ? _value.lotteries
          : lotteries // ignore: cast_nullable_to_non_nullable
              as List<Lottery>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $LotteryStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Lottery> lotteries});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LotteryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lotteries = null,
  }) {
    return _then(_$InitialImpl(
      null == lotteries
          ? _value._lotteries
          : lotteries // ignore: cast_nullable_to_non_nullable
              as List<Lottery>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(final List<Lottery> lotteries) : _lotteries = lotteries;

  final List<Lottery> _lotteries;
  @override
  List<Lottery> get lotteries {
    if (_lotteries is EqualUnmodifiableListView) return _lotteries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lotteries);
  }

  @override
  String toString() {
    return 'LotteryState.initial(lotteries: $lotteries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._lotteries, _lotteries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lotteries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Lottery> lotteries) initial,
    required TResult Function(List<Lottery> lotteries) loading,
    required TResult Function(List<Lottery> lotteries) loaded,
    required TResult Function(List<Lottery> lotteries, String reason) error,
  }) {
    return initial(lotteries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Lottery> lotteries)? initial,
    TResult? Function(List<Lottery> lotteries)? loading,
    TResult? Function(List<Lottery> lotteries)? loaded,
    TResult? Function(List<Lottery> lotteries, String reason)? error,
  }) {
    return initial?.call(lotteries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Lottery> lotteries)? initial,
    TResult Function(List<Lottery> lotteries)? loading,
    TResult Function(List<Lottery> lotteries)? loaded,
    TResult Function(List<Lottery> lotteries, String reason)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(lotteries);
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

abstract class _Initial implements LotteryState {
  const factory _Initial(final List<Lottery> lotteries) = _$InitialImpl;

  @override
  List<Lottery> get lotteries;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $LotteryStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Lottery> lotteries});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LotteryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lotteries = null,
  }) {
    return _then(_$LoadingImpl(
      null == lotteries
          ? _value._lotteries
          : lotteries // ignore: cast_nullable_to_non_nullable
              as List<Lottery>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(final List<Lottery> lotteries) : _lotteries = lotteries;

  final List<Lottery> _lotteries;
  @override
  List<Lottery> get lotteries {
    if (_lotteries is EqualUnmodifiableListView) return _lotteries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lotteries);
  }

  @override
  String toString() {
    return 'LotteryState.loading(lotteries: $lotteries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._lotteries, _lotteries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lotteries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Lottery> lotteries) initial,
    required TResult Function(List<Lottery> lotteries) loading,
    required TResult Function(List<Lottery> lotteries) loaded,
    required TResult Function(List<Lottery> lotteries, String reason) error,
  }) {
    return loading(lotteries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Lottery> lotteries)? initial,
    TResult? Function(List<Lottery> lotteries)? loading,
    TResult? Function(List<Lottery> lotteries)? loaded,
    TResult? Function(List<Lottery> lotteries, String reason)? error,
  }) {
    return loading?.call(lotteries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Lottery> lotteries)? initial,
    TResult Function(List<Lottery> lotteries)? loading,
    TResult Function(List<Lottery> lotteries)? loaded,
    TResult Function(List<Lottery> lotteries, String reason)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(lotteries);
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

abstract class _Loading implements LotteryState {
  const factory _Loading(final List<Lottery> lotteries) = _$LoadingImpl;

  @override
  List<Lottery> get lotteries;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $LotteryStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Lottery> lotteries});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$LotteryStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lotteries = null,
  }) {
    return _then(_$LoadedImpl(
      null == lotteries
          ? _value._lotteries
          : lotteries // ignore: cast_nullable_to_non_nullable
              as List<Lottery>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<Lottery> lotteries) : _lotteries = lotteries;

  final List<Lottery> _lotteries;
  @override
  List<Lottery> get lotteries {
    if (_lotteries is EqualUnmodifiableListView) return _lotteries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lotteries);
  }

  @override
  String toString() {
    return 'LotteryState.loaded(lotteries: $lotteries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._lotteries, _lotteries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lotteries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Lottery> lotteries) initial,
    required TResult Function(List<Lottery> lotteries) loading,
    required TResult Function(List<Lottery> lotteries) loaded,
    required TResult Function(List<Lottery> lotteries, String reason) error,
  }) {
    return loaded(lotteries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Lottery> lotteries)? initial,
    TResult? Function(List<Lottery> lotteries)? loading,
    TResult? Function(List<Lottery> lotteries)? loaded,
    TResult? Function(List<Lottery> lotteries, String reason)? error,
  }) {
    return loaded?.call(lotteries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Lottery> lotteries)? initial,
    TResult Function(List<Lottery> lotteries)? loading,
    TResult Function(List<Lottery> lotteries)? loaded,
    TResult Function(List<Lottery> lotteries, String reason)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(lotteries);
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

abstract class _Loaded implements LotteryState {
  const factory _Loaded(final List<Lottery> lotteries) = _$LoadedImpl;

  @override
  List<Lottery> get lotteries;
  @override
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $LotteryStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Lottery> lotteries, String reason});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LotteryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lotteries = null,
    Object? reason = null,
  }) {
    return _then(_$ErrorImpl(
      null == lotteries
          ? _value._lotteries
          : lotteries // ignore: cast_nullable_to_non_nullable
              as List<Lottery>,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(final List<Lottery> lotteries, this.reason)
      : _lotteries = lotteries;

  final List<Lottery> _lotteries;
  @override
  List<Lottery> get lotteries {
    if (_lotteries is EqualUnmodifiableListView) return _lotteries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lotteries);
  }

  @override
  final String reason;

  @override
  String toString() {
    return 'LotteryState.error(lotteries: $lotteries, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality()
                .equals(other._lotteries, _lotteries) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_lotteries), reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Lottery> lotteries) initial,
    required TResult Function(List<Lottery> lotteries) loading,
    required TResult Function(List<Lottery> lotteries) loaded,
    required TResult Function(List<Lottery> lotteries, String reason) error,
  }) {
    return error(lotteries, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Lottery> lotteries)? initial,
    TResult? Function(List<Lottery> lotteries)? loading,
    TResult? Function(List<Lottery> lotteries)? loaded,
    TResult? Function(List<Lottery> lotteries, String reason)? error,
  }) {
    return error?.call(lotteries, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Lottery> lotteries)? initial,
    TResult Function(List<Lottery> lotteries)? loading,
    TResult Function(List<Lottery> lotteries)? loaded,
    TResult Function(List<Lottery> lotteries, String reason)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(lotteries, reason);
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

abstract class _Error implements LotteryState {
  const factory _Error(final List<Lottery> lotteries, final String reason) =
      _$ErrorImpl;

  @override
  List<Lottery> get lotteries;
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
