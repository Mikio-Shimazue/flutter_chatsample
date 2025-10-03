import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chatsample/provider.dart';
import 'package:chatsample/chat/repository/chat_center/chat_center_repository.dart';
import 'package:chatsample/chat/repository/chat_center/chat_center_response_model.dart';

part 'chatroomlist_state.freezed.dart';

@freezed
class ChatRoomListState with _$ChatRoomListState {
  const factory ChatRoomListState(
      {required String chatRoomListsSearch,
      required List<ChatRoomItem> chatRoomLists}) = _ChatRoomListState;
}

class ChatRoomListController extends StateNotifier<ChatRoomListState> {
  ChatRoomListController(this.ref)
      : super(const ChatRoomListState(
            chatRoomListsSearch: "", chatRoomLists: []));

  Ref ref;

  final _storage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() => IOSOptions();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  //  初期値取得処理
  Future<void> load() async {
    getContactList("");
  }

  set chatRoomListSearch(String text) {
    getContactList(text);
  }

  clear() async {
    _storage.write(key: 'chatRoomLists_state', value: '[]');
    state = state.copyWith(chatRoomLists: []);
  }

  delItem(ChatRoomItem item) async {
    state.chatRoomLists.remove(item);
    _storage.write(
        key: 'chatRoomLists_state', value: json.encode(state.chatRoomLists));

    state.chatRoomLists.sort((a, b) => b.roomId.compareTo(a.roomId));
    state = state.copyWith(chatRoomLists: state.chatRoomLists);
  }

  addItem(ChatRoomItem item) async {
    state.chatRoomLists.add(item);
    _storage.write(
        key: 'chatRoomLists_state', value: json.encode(state.chatRoomLists));

    state.chatRoomLists.sort((a, b) => b.roomId.compareTo(a.roomId));
    state = state.copyWith(chatRoomLists: state.chatRoomLists);
  }

  getContactList(String text) async {
    //  FAX受信一覧取得
    final chatRoomList = await ChatCenterRepository().getChatRoomList();

    //  var contacts = await ref.read(contactRepositoryProvider).getContact();
    var contacts = null;
    if (chatRoomList != null) {
      List<ChatRoomItem> list = [];

      for (var item in chatRoomList.chatRoomLists) {
        bool isHit = true;
        if (isHit) {
          list.add(item);
        }
      }
      list.sort((a, b) => b.roomId.compareTo(a.roomId));
      state = state.copyWith(chatRoomLists: list);
    }
  }
}
