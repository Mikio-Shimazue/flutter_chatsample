// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'faxreceivelist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FaxReceiveListStateTearOff {
  const _$FaxReceiveListStateTearOff();

  _FaxReceiveListState call(
      {required String receiveListSearch,
      required List<FaxReceiveItem> receiveList}) {
    return _FaxReceiveListState(
      receiveListSearch: receiveListSearch,
      receiveList: receiveList,
    );
  }
}

/// @nodoc
const $FaxReceiveListState = _$FaxReceiveListStateTearOff();

/// @nodoc
mixin _$FaxReceiveListState {
  String get receiveListSearch => throw _privateConstructorUsedError;
  List<FaxReceiveItem> get receiveList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaxReceiveListStateCopyWith<FaxReceiveListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaxReceiveListStateCopyWith<$Res> {
  factory $FaxReceiveListStateCopyWith(
          FaxReceiveListState value, $Res Function(FaxReceiveListState) then) =
      _$FaxReceiveListStateCopyWithImpl<$Res>;
  $Res call({String receiveListSearch, List<FaxReceiveItem> receiveList});
}

/// @nodoc
class _$FaxReceiveListStateCopyWithImpl<$Res>
    implements $FaxReceiveListStateCopyWith<$Res> {
  _$FaxReceiveListStateCopyWithImpl(this._value, this._then);

  final FaxReceiveListState _value;
  // ignore: unused_field
  final $Res Function(FaxReceiveListState) _then;

  @override
  $Res call({
    Object? receiveListSearch = freezed,
    Object? receiveList = freezed,
  }) {
    return _then(_value.copyWith(
      receiveListSearch: receiveListSearch == freezed
          ? _value.receiveListSearch
          : receiveListSearch // ignore: cast_nullable_to_non_nullable
              as String,
      receiveList: receiveList == freezed
          ? _value.receiveList
          : receiveList // ignore: cast_nullable_to_non_nullable
              as List<FaxReceiveItem>,
    ));
  }
}

/// @nodoc
abstract class _$FaxReceiveListStateCopyWith<$Res>
    implements $FaxReceiveListStateCopyWith<$Res> {
  factory _$FaxReceiveListStateCopyWith(_FaxReceiveListState value,
          $Res Function(_FaxReceiveListState) then) =
      __$FaxReceiveListStateCopyWithImpl<$Res>;
  @override
  $Res call({String receiveListSearch, List<FaxReceiveItem> receiveList});
}

/// @nodoc
class __$FaxReceiveListStateCopyWithImpl<$Res>
    extends _$FaxReceiveListStateCopyWithImpl<$Res>
    implements _$FaxReceiveListStateCopyWith<$Res> {
  __$FaxReceiveListStateCopyWithImpl(
      _FaxReceiveListState _value, $Res Function(_FaxReceiveListState) _then)
      : super(_value, (v) => _then(v as _FaxReceiveListState));

  @override
  _FaxReceiveListState get _value => super._value as _FaxReceiveListState;

  @override
  $Res call({
    Object? receiveListSearch = freezed,
    Object? receiveList = freezed,
  }) {
    return _then(_FaxReceiveListState(
      receiveListSearch: receiveListSearch == freezed
          ? _value.receiveListSearch
          : receiveListSearch // ignore: cast_nullable_to_non_nullable
              as String,
      receiveList: receiveList == freezed
          ? _value.receiveList
          : receiveList // ignore: cast_nullable_to_non_nullable
              as List<FaxReceiveItem>,
    ));
  }
}

/// @nodoc

class _$_FaxReceiveListState
    with DiagnosticableTreeMixin
    implements _FaxReceiveListState {
  const _$_FaxReceiveListState(
      {required this.receiveListSearch, required this.receiveList});

  @override
  final String receiveListSearch;
  @override
  final List<FaxReceiveItem> receiveList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaxReceiveListState(receiveListSearch: $receiveListSearch, receiveList: $receiveList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaxReceiveListState'))
      ..add(DiagnosticsProperty('receiveListSearch', receiveListSearch))
      ..add(DiagnosticsProperty('receiveList', receiveList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FaxReceiveListState &&
            const DeepCollectionEquality()
                .equals(other.receiveListSearch, receiveListSearch) &&
            const DeepCollectionEquality()
                .equals(other.receiveList, receiveList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(receiveListSearch),
      const DeepCollectionEquality().hash(receiveList));

  @JsonKey(ignore: true)
  @override
  _$FaxReceiveListStateCopyWith<_FaxReceiveListState> get copyWith =>
      __$FaxReceiveListStateCopyWithImpl<_FaxReceiveListState>(
          this, _$identity);
}

abstract class _FaxReceiveListState implements FaxReceiveListState {
  const factory _FaxReceiveListState(
      {required String receiveListSearch,
      required List<FaxReceiveItem> receiveList}) = _$_FaxReceiveListState;

  @override
  String get receiveListSearch;
  @override
  List<FaxReceiveItem> get receiveList;
  @override
  @JsonKey(ignore: true)
  _$FaxReceiveListStateCopyWith<_FaxReceiveListState> get copyWith =>
      throw _privateConstructorUsedError;
}
