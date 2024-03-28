// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charada_clasica_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CharadaClasicaState {
  List<CharadaNumber> get numbers => throw _privateConstructorUsedError;
  List<CharadaNumber> get filteredNumbers => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        initial,
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        loading,
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        initial,
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loading,
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        initial,
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loading,
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharadaClasicaStateCopyWith<CharadaClasicaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharadaClasicaStateCopyWith<$Res> {
  factory $CharadaClasicaStateCopyWith(
          CharadaClasicaState value, $Res Function(CharadaClasicaState) then) =
      _$CharadaClasicaStateCopyWithImpl<$Res, CharadaClasicaState>;
  @useResult
  $Res call({List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers});
}

/// @nodoc
class _$CharadaClasicaStateCopyWithImpl<$Res, $Val extends CharadaClasicaState>
    implements $CharadaClasicaStateCopyWith<$Res> {
  _$CharadaClasicaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? filteredNumbers = null,
  }) {
    return _then(_value.copyWith(
      numbers: null == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<CharadaNumber>,
      filteredNumbers: null == filteredNumbers
          ? _value.filteredNumbers
          : filteredNumbers // ignore: cast_nullable_to_non_nullable
              as List<CharadaNumber>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CharadaClasicaStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CharadaClasicaStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? filteredNumbers = null,
  }) {
    return _then(_$InitialImpl(
      null == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<CharadaNumber>,
      null == filteredNumbers
          ? _value._filteredNumbers
          : filteredNumbers // ignore: cast_nullable_to_non_nullable
              as List<CharadaNumber>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(final List<CharadaNumber> numbers,
      final List<CharadaNumber> filteredNumbers)
      : _numbers = numbers,
        _filteredNumbers = filteredNumbers;

  final List<CharadaNumber> _numbers;
  @override
  List<CharadaNumber> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  final List<CharadaNumber> _filteredNumbers;
  @override
  List<CharadaNumber> get filteredNumbers {
    if (_filteredNumbers is EqualUnmodifiableListView) return _filteredNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredNumbers);
  }

  @override
  String toString() {
    return 'CharadaClasicaState.initial(numbers: $numbers, filteredNumbers: $filteredNumbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality()
                .equals(other._filteredNumbers, _filteredNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_filteredNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        initial,
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        loading,
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        loaded,
  }) {
    return initial(numbers, filteredNumbers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        initial,
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loading,
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loaded,
  }) {
    return initial?.call(numbers, filteredNumbers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        initial,
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loading,
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(numbers, filteredNumbers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CharadaClasicaState {
  const factory _Initial(final List<CharadaNumber> numbers,
      final List<CharadaNumber> filteredNumbers) = _$InitialImpl;

  @override
  List<CharadaNumber> get numbers;
  @override
  List<CharadaNumber> get filteredNumbers;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $CharadaClasicaStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CharadaClasicaStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? filteredNumbers = null,
  }) {
    return _then(_$LoadingImpl(
      null == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<CharadaNumber>,
      null == filteredNumbers
          ? _value._filteredNumbers
          : filteredNumbers // ignore: cast_nullable_to_non_nullable
              as List<CharadaNumber>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(final List<CharadaNumber> numbers,
      final List<CharadaNumber> filteredNumbers)
      : _numbers = numbers,
        _filteredNumbers = filteredNumbers;

  final List<CharadaNumber> _numbers;
  @override
  List<CharadaNumber> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  final List<CharadaNumber> _filteredNumbers;
  @override
  List<CharadaNumber> get filteredNumbers {
    if (_filteredNumbers is EqualUnmodifiableListView) return _filteredNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredNumbers);
  }

  @override
  String toString() {
    return 'CharadaClasicaState.loading(numbers: $numbers, filteredNumbers: $filteredNumbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality()
                .equals(other._filteredNumbers, _filteredNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_filteredNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        initial,
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        loading,
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        loaded,
  }) {
    return loading(numbers, filteredNumbers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        initial,
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loading,
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loaded,
  }) {
    return loading?.call(numbers, filteredNumbers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        initial,
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loading,
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(numbers, filteredNumbers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CharadaClasicaState {
  const factory _Loading(final List<CharadaNumber> numbers,
      final List<CharadaNumber> filteredNumbers) = _$LoadingImpl;

  @override
  List<CharadaNumber> get numbers;
  @override
  List<CharadaNumber> get filteredNumbers;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $CharadaClasicaStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CharadaClasicaStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? filteredNumbers = null,
  }) {
    return _then(_$LoadedImpl(
      null == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<CharadaNumber>,
      null == filteredNumbers
          ? _value._filteredNumbers
          : filteredNumbers // ignore: cast_nullable_to_non_nullable
              as List<CharadaNumber>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<CharadaNumber> numbers,
      final List<CharadaNumber> filteredNumbers)
      : _numbers = numbers,
        _filteredNumbers = filteredNumbers;

  final List<CharadaNumber> _numbers;
  @override
  List<CharadaNumber> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  final List<CharadaNumber> _filteredNumbers;
  @override
  List<CharadaNumber> get filteredNumbers {
    if (_filteredNumbers is EqualUnmodifiableListView) return _filteredNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredNumbers);
  }

  @override
  String toString() {
    return 'CharadaClasicaState.loaded(numbers: $numbers, filteredNumbers: $filteredNumbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality()
                .equals(other._filteredNumbers, _filteredNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_filteredNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        initial,
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        loading,
    required TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)
        loaded,
  }) {
    return loaded(numbers, filteredNumbers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        initial,
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loading,
    TResult? Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loaded,
  }) {
    return loaded?.call(numbers, filteredNumbers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        initial,
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loading,
    TResult Function(
            List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(numbers, filteredNumbers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CharadaClasicaState {
  const factory _Loaded(final List<CharadaNumber> numbers,
      final List<CharadaNumber> filteredNumbers) = _$LoadedImpl;

  @override
  List<CharadaNumber> get numbers;
  @override
  List<CharadaNumber> get filteredNumbers;
  @override
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
