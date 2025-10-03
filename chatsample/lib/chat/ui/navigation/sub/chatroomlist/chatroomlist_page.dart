import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chatsample/provider.dart';
import 'package:chatsample/chat/ui/widget_original/chatroomlisttile.dart';
import 'package:chatsample/chat/ui/navigation/sub/chatroom/chatroom_page.dart';
import 'package:chatsample/chat/repository/chat_center/chat_center_response_model.dart';

class ChatRoomListPage extends StatelessWidget {
  const ChatRoomListPage({Key? key}) : super(key: key);

  //  TextEditingControllerはstatic final で宣言しないと再生成により値が消えるので注意
  static final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        if (!ref.watch(chatRoomListLoadedProvider)) {
          Future.delayed(const Duration(seconds: 0)).then((_) async {
            //  ここで初期値読み込み処理
            _searchController.text = "";
            ref
                .read(chatRoomListIsControllProvider.notifier)
                .chatRoomListSearch = _searchController.text;
            ref.read(chatRoomListLoadedProvider.notifier).state = true;
          });
        }

        return Scaffold(
          appBar: AppBar(
              //  automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: const Color(0xFFC0F1F2),
              title: SizedBox(
                child: TextField(
                  controller: _searchController,
                  onChanged: (text) {
                    ref
                        .read(chatRoomListIsControllProvider.notifier)
                        .chatRoomListSearch = text;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white38,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'チャットルームを検索',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _searchController.text = '';
                        ref
                            .read(chatRoomListIsControllProvider.notifier)
                            .chatRoomListSearch = _searchController.text;
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              )),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            top: true,
            child: !ref.watch(chatRoomListLoadedProvider)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: ref
                                .watch(chatRoomListIsControllProvider)
                                .chatRoomLists
                                .length,
                            itemBuilder: (context, index) {
                              return ChatRoomListTile(
                                onTap: () {
                                  print('onTap');
                                  ChatRoomItem chatRoom = ref
                                      .read(chatRoomListIsControllProvider)
                                      .chatRoomLists[index];

                                  //  リストタップ時の処理
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const ChatRoomPage('My Room'),
                                  ));
                                },
                                title: Text(
                                  ref
                                      .read(chatRoomListIsControllProvider)
                                      .chatRoomLists[index]
                                      .roomId
                                      .toString(),
                                ),
                                subtitle: const Text(
                                  'すずき ●\nさとう　×\nたかはし ×',
                                ),
                                detailInfo: Text(
                                  ref
                                      .read(chatRoomListIsControllProvider)
                                      .chatRoomLists[index]
                                      .roomName
                                      .toString(),
                                ),
                                trailing1: const Icon(Icons.input),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
          ),
        );
      },
    );
  }

  static Widget createIconWidget(
      BuildContext context, WidgetRef ref, IconData iconData) {
    return const Icon(
      Icons.picture_as_pdf,
      color: Color(0xFC0F1F2),
    );
  }
}
