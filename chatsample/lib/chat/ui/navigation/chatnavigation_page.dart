import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chatsample/provider.dart';
import 'package:chatsample/fax/ui/navigation/faxnavigation_page.dart';
import 'package:chatsample/chat/ui/navigation/sub/chatroomlist/chatroomlist_page.dart';

class ChatNavigationPage extends StatelessWidget {
  const ChatNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      //  BottomNavigationBarは２つ以上設定しないと作成できない仕様のため、ここでは２つ配置し、２つ目は表示側で制御し見えなくする
      final List<TabItem> tabItems = [
        TabItem(1, "ルーム", Colors.orange, const Icon(Icons.meeting_room),
            const Icon(Icons.meeting_room)),
        TabItem(2, "電話帳", Colors.blue, const Icon(Icons.phone),
            const Icon(Icons.phone)),
      ];

      final pages = [
        //  チャットルームリスト表示
        const ChatRoomListPage(),
      ];

      if (!ref.watch(navigateIsLoadedProvider)) {
        Future.delayed(const Duration(seconds: 0)).then((_) async {
          //  ここで初期値読み込み処理
          await ref.read(chatNavigationControllerProvider.notifier).load();
          ref.read(navigateIsLoadedProvider.notifier).state = true;
        });
      }

      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: pages[0],
            top: false,
          ),
          //  Make the Thema transparent and disable for tap splash effect.
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              items: tabItems
                  .where((o) => o.id > 0)
                  .map((o) => _buildItem(o))
                  .toList(),
              onTap: null,
              //  タップ無効化　NavigationBarで複数画面対応時は以下のコメントアウト処理を有効化にすることで対応可
              //  (index) {
              //    ref.read(chatNavigationControllerProvider.notifier).currentIndex = index;
              //  }
              currentIndex:
                  ref.watch(chatNavigationControllerProvider).currentIndex,
              //  selectedItemColor: currentTab.color,
              fixedColor: const Color(0xFF00B1B2),
              unselectedItemColor: const Color(0x0000B1B2),
            ),
          ),
        ),
      );
    });
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: tabItem.icon,
      activeIcon: tabItem.activeIcon,
      label: tabItem.title,
    );
  }
}
