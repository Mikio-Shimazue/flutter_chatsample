import 'dart:async';

//import 'package:connectiveity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../../app.dart';
import '../../../provider.dart';

class IosRepository {

  final Ref ref;

  IosRepository(this.ref) {
    //  nativeからの戻りイベント
    platform.setMethodCallHandler(
            (call) async {
          switch (call.method) {
            case 'provisioning_success':
              print(call.arguments["call_name"]);
              if (call.arguments["call_name"] == "login") {
//                App.navigator!.pushReplacementNamed("faxnavigation");
                App.navigator!.pushReplacementNamed("chatnavigation");
              }
              //  引数がある場合はcall.argumentsに入っています。
              /*
              ref
                  .read(dialControllerProvider.notifier)
                  .srcPhoneNumber = call.arguments["src_phone_number"];
              ref
                  .read(settingControllerProvider.notifer)
                  .srcPhoneNumber = call.arguments["src_phone_number"];
              ref
                  .read(settingControllerProvider.notifier)
                  .srcExtNumber = call.arguments["src_ext_number"];

               */
              ref.read(loginControllerProvider.notifier).save();

              await Future.delayed(const Duration(seconds: 1)).then((_) async {
                /*
                if (ref
                    .read(settingControllerProvider)
                    .accountIsEnabled &&
                    ref
                        .read(settingControllerProvider)
                        .voipIsEnabled) {
                  registSip("ios_repository_setMethodCallHandler");
                }

                 */
              });
              break;
            case 'provisioning_error':
              App.navigator!.pushReplacementNamed("login");
              Fluttertoast.showToast(msg: "ログインに失敗しました");
              // 引数があるbさ愛は call.arguments に入っています。
              /*
              ref
                  .read(dialControllerProvider.notifier)
                  .srcPhoneNumber = "";
              ref
                  .read(settingControllerProvider.notifier)
                  .srcPhoneNumber = "";
              ref
                  .read(settingControllerProvider.notifier)
                  .srcExtNumber = "";

               */
              break;
            case 'call_start':
              print("=1=call_start");
              /*
              if (call.arguments["call_type"] != "transfer") {
                App.navigator!.pushReplacementNamed("calling");
                ref.read(callingControllerProvider.notifier).init();
                ref
                    .read(callingControllerProvider.notifier)
                    .currentDstPhoneNumber = call.arguments["dst_phone_number"];
              }

               */
              break;
            default:
              Fluttertoast.showToast(msg: " Msg該当なし");
              break;
          }
          return true;
        }
    );
  }

  //  native呼び出し
  static const platform = MethodChannel('com.chatsample-mikishi.methodchannel/chatsample.sdk');

  Future<Map<dynamic, dynamic>> getOldStrettoInfo() async {
    /*
    try {
      Map nativeParams = <String, dynamic>{};
      return await platform.invokeMethod('get_old_stretto_info', nativeParams);
    } on PlatformException catch (e) {
      print("Failed to getOldStrettoInfo: '${e.message}'.");
    }

     */

    Map<String, String> ret = {"pw":"","id":""};

    return ret;
  }

  Future<void> registStretto(String name) async {
    try {
      Map nativeParams = <String, dynamic>{};
      nativeParams["name"] = name;
      nativeParams["stretto_id"] = ref
          .read(loginControllerProvider)
          .strettoId;
      nativeParams["stretto_pw"] = ref
          .read(loginControllerProvider)
          .strettoPw;
      await platform.invokeMethod('regist_stretto', nativeParams);
    } on PlatformException catch (e){
      print("Failed to registStretto:'${e.message}'.");
    }
  }

  Future<void> unRegistStretto() async{
    try {
      Map nativeParams = <String, dynamic>{};
      await platform.invokeMethod('un_regist_stretto', nativeParams);
    } on PlatformException catch(e){
      print("Failed to unRegistStretto: '${e.message}'.");
    }
  }

  Future<void> registSip(String debug) async{
    try {
      Map nativeParams = <String, dynamic>{};
      nativeParams["debug"] = debug;
      await platform.invokeMethod('regist_sip', nativeParams);
    } on PlatformException catch (e){
      print("Failed to registSip: '${e.message}'.");
    }
  }

  Future<void> unRegistSip() async {
    try{
      Map nativeParams = <String,dynamic>{};
      await platform.invokeMethod('un_regist_sip', nativeParams);
    } on PlatformException catch(e){
      print("Failed to unRegisterSip: '${e.message}'.");
    }
  }

  Future<void> mute() async{
    try{
      Map nativeParams = <String, dynamic>{};
      await platform.invokeMethod('mute',nativeParams);
    } on PlatformException catch(e){
      print("Failed to mute: '${e.message}'.");
    }
  }

  Future<void> unmute() async{
    try{
      Map nativeParams = <String, dynamic>{};
      await platform.invokeMethod('un_mute', nativeParams);
    } on PlatformException catch(e){
      print("Failed to un_mute: '${e.message}'.");
    }
  }

}
