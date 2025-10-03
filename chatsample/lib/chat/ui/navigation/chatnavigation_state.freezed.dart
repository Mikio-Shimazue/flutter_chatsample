// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chatnavigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatNavigationStateTearOff {
  const _$ChatNavigationStateTearOff();

  _ChatNavigationState call({required int currentIndex}) {
    return _ChatNavigationState(
      currentIndex: currentIndex,
    );
  }
}

/// @nodoc
const $ChatNavigationState = _$ChatNavigationStateTearOff();

/// @nodoc
mixin _$ChatNavigationState {
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatNavigationStateCopyWith<ChatNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatNavigationStateCopyWith<$Res> {
  factory $ChatNavigationStateCopyWith(
          ChatNavigationState value, $Res Function(ChatNavigationState) then) =
      _$ChatNavigationStateCopyWithImpl<$Res>;

  $Res call({int currentIndex});
}

/// @nodoc
class _$ChatNavigationStateCopyWithImpl<$Res>
    implements $ChatNavigationStateCopyWith<$Res> {
  _$ChatNavigationStateCopyWithImpl(this._value, this._then);

  final ChatNavigationState _value;

  // ignore: unused_field
  final $Res Function(ChatNavigationState) _then;

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
abstract class _$ChatNavigationStateCopyWith<$Res>
    implements $ChatNavigationStateCopyWith<$Res> {
  factory _$ChatNavigationStateCopyWith(_ChatNavigationState value,
          $Res Function(_ChatNavigationState) then) =
      __$ChatNavigationStateCopyWithImpl<$Res>;

  @override
  $Res call({int currentIndex});
}

/// @nodoc
class __$ChatNavigationStateCopyWithImpl<$Res>
    extends _$ChatNavigationStateCopyWithImpl<$Res>
    implements _$ChatNavigationStateCopyWith<$Res> {
  __$ChatNavigationStateCopyWithImpl(
      _ChatNavigationState _value, $Res Function(_ChatNavigationState) _then)
      : super(_value, (v) => _then(v as _ChatNavigationState));

  @override
  _ChatNavigationState get _value => super._value as _ChatNavigationState;

  @override
  $Res call({
    Object? currentIndex = freezed,
  }) {
    return _then(_ChatNavigationState(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChatNavigationState implements _ChatNavigationState {
  const _$_ChatNavigationState({required this.currentIndex});

  @override
  final int currentIndex;

  @override
  String toString() {
    return 'ChatNavigationState(currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatNavigationState &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentIndex));

  @JsonKey(ignore: true)
  @override
  _$ChatNavigationStateCopyWith<_ChatNavigationState> get copyWith =>
      __$ChatNavigationStateCopyWithImpl<_ChatNavigationState>(
          this, _$identity);
}

abstract class _ChatNavigationState implements ChatNavigationState {
  const factory _ChatNavigationState({required int currentIndex}) =
      _$_ChatNavigationState;

  @override
  int get currentIndex;

  @override
  @JsonKey(ignore: true)
  _$ChatNavigationStateCopyWith<_ChatNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
