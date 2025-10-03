import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chatsample/share/ui/login/login_page.dart';
import 'package:chatsample/fax/ui/navigation/faxnavigation_page.dart';
import 'package:chatsample/chat/ui/navigation/chatnavigation_page.dart';

class App extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const App({Key? key}) : super(key: key);

  static NavigatorState? get navigator => navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        Future.delayed(const Duration(seconds: 0)).then((_) async {
         // await ref.read(soundRepositoryProvider).load();
        });

        return MaterialApp(
          home: const LoginPage(),
          routes: <String, WidgetBuilder>{
            'faxnavigation': (BuildContext context) => const FaxNavigationPage(),
            'chatnavigation':(BuildContext context) => const ChatNavigationPage(),
          },
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
