import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chatsample/provider.dart';
import 'package:chatsample/fax/repository/center/center_repository.dart';
import 'package:chatsample/fax/repository/center/center_response_model.dart';

part 'faxreceivelist_state.freezed.dart';

@freezed
class FaxReceiveListState with _$FaxReceiveListState {
  const factory FaxReceiveListState({
    required String receiveListSearch,
    required List<FaxReceiveItem> receiveList
  }) = _FaxReceiveListState;
}

class FaxReceiveListController extends StateNotifier<FaxReceiveListState> {
  FaxReceiveListController(this.ref)
      : super(
      const FaxReceiveListState(receiveListSearch: "", receiveList: []));

  Ref ref;

  final _storage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() => IOSOptions();

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  //  初期値取得処理
  Future<void> load() async {
    getContactList("");
  }

  set receiveListSearch(String text) {
    getContactList(text);
  }

  Future<void> DownLoadReceiveList() async {
    final faxReceiveList = await CenterRepository().getFaxReceiveList();
    if (kDebugMode) {
      print(
        "max_page_no:$faxReceiveList.maxPageNo page_cnt:$faxReceiveList.pageCnt");
    }

    faxReceiveList.receiveItems.sort((a, b) =>
        b.receiveDate.compareTo(a.receiveDate));

    return;
  }

  clear() async {
    _storage.write(key: "receiveList_state", value: "[]");
    state = state.copyWith(receiveList: []);
  }

  delItem(FaxReceiveItem item) async {
    state.receiveList.remove(item);
    _storage.write(
        key: "receiveList_state", value: json.encode(state.receiveList));

    state.receiveList.sort((a, b) => b.receiveDate.compareTo(a.receiveDate));
    state = state.copyWith(receiveList: state.receiveList);
  }

  addItem(FaxReceiveItem item) async {
    state.receiveList.add(item);
    _storage.write(
        key: "receivevList_state", value: json.encode(state.receiveList));

    state.receiveList.sort((a, b) => b.receiveDate.compareTo(a.receiveDate));
    state = state.copyWith(receiveList: state.receiveList);
  }

  getContactList(String text) async {
    //  FAX受信一覧取得
    final faxReceiveList = await CenterRepository().getFaxReceiveList();

  //  var contacts = await ref.read(contactRepositoryProvider).getContact();
    var contacts = null;
    if (faxReceiveList != null) {
      List<FaxReceiveItem> list = [];

      for (var item in faxReceiveList.receiveItems) {
        bool isHit = false;
        if (item.srcTel.contains(text)) {
          isHit = true;
        }
        for (var contact in contacts) {
          if (contact.phones.any((element) =>
          element.number.replaceAll(" ", "") == item.srcTel)) {
            item.srsTel = contact.displayName;
            if (contact.displayName.replaceAll(" ", "").contains(text)) {
              isHit = true;
            }
          }
        }
        if (isHit) {
          list.add(item);
        }
      }
      list.sort((a, b) => b.receiveDate.compareTo(a.receiveDate));
      state = state.copyWith(receiveList: list);
    }
  }
}