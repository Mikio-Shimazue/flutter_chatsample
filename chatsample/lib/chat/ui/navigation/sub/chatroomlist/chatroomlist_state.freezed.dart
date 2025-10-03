// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chatroomlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatRoomListStateTearOff {
  const _$ChatRoomListStateTearOff();

  _ChatRoomListState call(
      {required String chatRoomListsSearch,
      required List<ChatRoomItem> chatRoomLists}) {
    return _ChatRoomListState(
      chatRoomListsSearch: chatRoomListsSearch,
      chatRoomLists: chatRoomLists,
    );
  }
}

/// @nodoc
const $ChatRoomListState = _$ChatRoomListStateTearOff();

/// @nodoc
mixin _$ChatRoomListState {
  String get chatRoomListsSearch => throw _privateConstructorUsedError;

  List<ChatRoomItem> get chatRoomLists => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatRoomListStateCopyWith<ChatRoomListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomListStateCopyWith<$Res> {
  factory $ChatRoomListStateCopyWith(
          ChatRoomListState value, $Res Function(ChatRoomListState) then) =
      _$ChatRoomListStateCopyWithImpl<$Res>;

  $Res call({String chatRoomListsSearch, List<ChatRoomItem> chatRoomLists});
}

/// @nodoc
class _$ChatRoomListStateCopyWithImpl<$Res>
    implements $ChatRoomListStateCopyWith<$Res> {
  _$ChatRoomListStateCopyWithImpl(this._value, this._then);

  final ChatRoomListState _value;

  // ignore: unused_field
  final $Res Function(ChatRoomListState) _then;

  @override
  $Res call({
    Object? chatRoomListsSearch = freezed,
    Object? chatRoomLists = freezed,
  }) {
    return _then(_value.copyWith(
      chatRoomListsSearch: chatRoomListsSearch == freezed
          ? _value.chatRoomListsSearch
          : chatRoomListsSearch // ignore: cast_nullable_to_non_nullable
              as String,
      chatRoomLists: chatRoomLists == freezed
          ? _value.chatRoomLists
          : chatRoomLists // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomItem>,
    ));
  }
}

/// @nodoc
abstract class _$ChatRoomListStateCopyWith<$Res>
    implements $ChatRoomListStateCopyWith<$Res> {
  factory _$ChatRoomListStateCopyWith(
          _ChatRoomListState value, $Res Function(_ChatRoomListState) then) =
      __$ChatRoomListStateCopyWithImpl<$Res>;

  @override
  $Res call({String chatRoomListsSearch, List<ChatRoomItem> chatRoomLists});
}

/// @nodoc
class __$ChatRoomListStateCopyWithImpl<$Res>
    extends _$ChatRoomListStateCopyWithImpl<$Res>
    implements _$ChatRoomListStateCopyWith<$Res> {
  __$ChatRoomListStateCopyWithImpl(
      _ChatRoomListState _value, $Res Function(_ChatRoomListState) _then)
      : super(_value, (v) => _then(v as _ChatRoomListState));

  @override
  _ChatRoomListState get _value => super._value as _ChatRoomListState;

  @override
  $Res call({
    Object? chatRoomListsSearch = freezed,
    Object? chatRoomLists = freezed,
  }) {
    return _then(_ChatRoomListState(
      chatRoomListsSearch: chatRoomListsSearch == freezed
          ? _value.chatRoomListsSearch
          : chatRoomListsSearch // ignore: cast_nullable_to_non_nullable
              as String,
      chatRoomLists: chatRoomLists == freezed
          ? _value.chatRoomLists
          : chatRoomLists // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomItem>,
    ));
  }
}

/// @nodoc

class _$_ChatRoomListState implements _ChatRoomListState {
  const _$_ChatRoomListState(
      {required this.chatRoomListsSearch, required this.chatRoomLists});

  @override
  final String chatRoomListsSearch;
  @override
  final List<ChatRoomItem> chatRoomLists;

  @override
  String toString() {
    return 'ChatRoomListState(chatRoomListsSearch: $chatRoomListsSearch, chatRoomLists: $chatRoomLists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatRoomListState &&
            const DeepCollectionEquality()
                .equals(other.chatRoomListsSearch, chatRoomListsSearch) &&
            const DeepCollectionEquality()
                .equals(other.chatRoomLists, chatRoomLists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chatRoomListsSearch),
      const DeepCollectionEquality().hash(chatRoomLists));

  @JsonKey(ignore: true)
  @override
  _$ChatRoomListStateCopyWith<_ChatRoomListState> get copyWith =>
      __$ChatRoomListStateCopyWithImpl<_ChatRoomListState>(this, _$identity);
}

abstract class _ChatRoomListState implements ChatRoomListState {
  const factory _ChatRoomListState(
      {required String chatRoomListsSearch,
      required List<ChatRoomItem> chatRoomLists}) = _$_ChatRoomListState;

  @override
  String get chatRoomListsSearch;

  @override
  List<ChatRoomItem> get chatRoomLists;

  @override
  @JsonKey(ignore: true)
  _$ChatRoomListStateCopyWith<_ChatRoomListState> get copyWith =>
      throw _privateConstructorUsedError;
}
