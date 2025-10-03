import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chatsample/provider.dart';
import './sub/faxreceivelist_page.dart';

class FaxNavigationPage extends StatelessWidget{
  const FaxNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Consumer(
      builder: (context,ref,child){
        final List<TabItem> tabItems = [
          TabItem(1,"受信一覧",Colors.orange,const Icon(Icons.fax),const Icon(Icons.fax)),
          TabItem(2,"受信一覧",Colors.blue,const Icon(Icons.send),const Icon(Icons.send)),
        ];

        final pages = [
          //  Fax受信リスト表示
          const FaxReceiveListPage(),
        ];

        if( !ref.watch(navigateIsLoadedProvider)){
          Future.delayed(const Duration(seconds: 0)).then((_) async{
            await ref.read(faxNavigationControllerProvider.notifier).load();
            ref.read(navigateIsLoadedProvider.notifier).state = true;
          });
        }

        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(child:pages[0],
              top:false,
            ),
            bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                unselectedFontSize: 0,
                type: BottomNavigationBarType.fixed,
                items: tabItems.where((o)=>o.id>0).map((o) => _buildItem(o)).toList(),
                onTap: null,
                  currentIndex: ref.watch(faxNavigationControllerProvider).currentIndex,
                fixedColor: const Color(0xFF00B1B2),
                unselectedItemColor: const Color(0x0000B1B2), //  選択されていないラベルを非表示に
                showUnselectedLabels: false,  //  選択されていないラベルを非表示に
              ),
            ),
          )
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem){
    return BottomNavigationBarItem(
        icon: tabItem.icon,
        activeIcon: tabItem.activeIcon,
        label: tabItem.title,
    );
  }
}

class TabItem{
  final int id;
  final String title;
  final MaterialColor color;
  final Icon icon;
  final Icon activeIcon;

  TabItem(this.id, this.title, this.color, this.icon, this.activeIcon);
}