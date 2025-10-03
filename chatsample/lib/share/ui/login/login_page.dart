import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:chatsample/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) :super(key: key);

  // TextEditingControllerはstatic final にしておかないと再生成で値が消える
  static final _userNameController = TextEditingController();
  static final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(child: Consumer(
        builder: (context, ref, child)
    {
      if (!ref.watch(loginIsLoadedProvider)){
        Future.delayed(const Duration(seconds: 0)).then((_) async {
          final prefs = await SharedPreferences.getInstance();
          //初回はここでデータ削除
          if (prefs.getBool('first_run') ?? true) {
            await ref.read(loginControllerProvider.notifier).clear();
       //     await ref.read(settingControllerProvider.notifier).clear();
       //     await ref.read(historyControllerProvider.notifier).clear();

            //  storage初期化
            await prefs.setBool("first_run",false);
          }
        }).then((value) async{
          //  ここで初期値読み込み処理
          await ref.read(loginControllerProvider.notifier).load();
          _userNameController.text = ref.read(loginControllerProvider).strettoId;
          _passwordController.text = ref.read(loginControllerProvider).strettoPw;
      //    await ref.read(settingControllerProvider.notifier).load();
      //    await ref.read(historyControllerProvider.notifier).load();
          ref.read(loginIsLoadedProvider.notifier).state = true;
        }).then((value) async {
          if (ref.read(loginControllerProvider).strettoId != "" && ref.read(loginControllerProvider).strettoPw != "") {
            await ref.read(loginControllerProvider.notifier).login();
          }
        });
      }
      return Scaffold(
        //  appBar: AppBar(
        //    centerTitle: true,
        //    backgroundColor: Colors.grey,
        //    title: const Text(data.srcPhoneNumber),
        //  ),
        resizeToAvoidBottomInset: false,
        body:!ref.watch(loginIsLoadedProvider)
            ? const Center(
            child: CircularProgressIndicator(),
        )
            : Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                      child: Image.asset('assets/images/logo(Transparent).png'),
                    ),
            ),
                Expanded(
                    flex:5,
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            keyboardType:  TextInputType.emailAddress,
                            controller:_userNameController,
                            onChanged: (text) {
                              ref.read(loginControllerProvider.notifier).strettoId = text;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter a user name',
                              suffixIcon: IconButton(
                                onPressed: _userNameController.clear,
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            onChanged: (text) {
                              ref.read(loginControllerProvider.notifier).strettoPw = text;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter a password',
                              suffixIcon: IconButton(
                                onPressed: _passwordController.clear,
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                //
                                ref.read(loginControllerProvider.notifier).login();
                                //
                              },
                              child: const Text("ログイン")
                          )
                        ],
                    )
                    )),
              ],
            ),
        )
      );
    }
    ));
  }
}