// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'faxnavigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FaxNavigationStateTearOff {
  const _$FaxNavigationStateTearOff();

  _FaxNavigationState call({required int currentIndex}) {
    return _FaxNavigationState(
      currentIndex: currentIndex,
    );
  }
}

/// @nodoc
const $FaxNavigationState = _$FaxNavigationStateTearOff();

/// @nodoc
mixin _$FaxNavigationState {
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaxNavigationStateCopyWith<FaxNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaxNavigationStateCopyWith<$Res> {
  factory $FaxNavigationStateCopyWith(
          FaxNavigationState value, $Res Function(FaxNavigationState) then) =
      _$FaxNavigationStateCopyWithImpl<$Res>;
  $Res call({int currentIndex});
}

/// @nodoc
class _$FaxNavigationStateCopyWithImpl<$Res>
    implements $FaxNavigationStateCopyWith<$Res> {
  _$FaxNavigationStateCopyWithImpl(this._value, this._then);

  final FaxNavigationState _value;
  // ignore: unused_field
  final $Res Function(FaxNavigationState) _then;

  @override
  $Res call({
    Object? currentIndex = freezed,
  }) {
    return _then(_value.copyWith(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$FaxNavigationStateCopyWith<$Res>
    implements $FaxNavigationStateCopyWith<$Res> {
  factory _$FaxNavigationStateCopyWith(
          _FaxNavigationState value, $Res Function(_FaxNavigationState) then) =
      __$FaxNavigationStateCopyWithImpl<$Res>;
  @override
  $Res call({int currentIndex});
}

/// @nodoc
class __$FaxNavigationStateCopyWithImpl<$Res>
    extends _$FaxNavigationStateCopyWithImpl<$Res>
    implements _$FaxNavigationStateCopyWith<$Res> {
  __$FaxNavigationStateCopyWithImpl(
      _FaxNavigationState _value, $Res Function(_FaxNavigationState) _then)
      : super(_value, (v) => _then(v as _FaxNavigationState));

  @override
  _FaxNavigationState get _value => super._value as _FaxNavigationState;

  @override
  $Res call({
    Object? currentIndex = freezed,
  }) {
    return _then(_FaxNavigationState(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FaxNavigationState implements _FaxNavigationState {
  const _$_FaxNavigationState({required this.currentIndex});

  @override
  final int currentIndex;

  @override
  String toString() {
    return 'FaxNavigationState(currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FaxNavigationState &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentIndex));

  @JsonKey(ignore: true)
  @override
  _$FaxNavigationStateCopyWith<_FaxNavigationState> get copyWith =>
      __$FaxNavigationStateCopyWithImpl<_FaxNavigationState>(this, _$identity);
}

abstract class _FaxNavigationState implements FaxNavigationState {
  const factory _FaxNavigationState({required int currentIndex}) =
      _$_FaxNavigationState;

  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$FaxNavigationStateCopyWith<_FaxNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
