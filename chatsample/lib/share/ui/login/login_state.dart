import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:chatsample/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {
        required String strettoId,
        required String strettoPw
      }) = _LoginState;
}

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref)
      : super(const LoginState(strettoId: "", strettoPw: ""));

  Ref ref;

  final _storage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() => const IOSOptions();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> load() async {
    final stateString = await _storage.read(
        key: "login_state",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    if (stateString != null) {
      var jsonStr = json.decode(stateString);
      if (jsonStr.containsKey("stretto_id")) {
        state = state.copyWith(strettoId: jsonStr['stretto_id']);
      }
      if (jsonStr.containsKey("stretto_pw")) {
        state = state.copyWith(strettoPw: jsonStr['stretto_pw']);
      }
    }
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.contacts,
    ].request();
  }

  Future<void> save() async {
    await _storage.write(key: 'login_state', value: json.encode(toJson()));
  }

  Future<void> clear() async {
    var oldLogin = await ref.read(iosRepositoryProvider).getOldStrettoInfo();
    state = LoginState(strettoId: oldLogin["id"], strettoPw: oldLogin["pw"]);
    await _storage.write(key: 'login_state', value: json.encode(toJson()));
  }

  Map<String, dynamic> toJson() =>
      {'stretto_id': state.strettoId, 'stretto_pw': state.strettoPw};

  Future<void> login() async {
    /*
    if (!await Permission.microphone.request().isGranted) {
      Fluttertoast.showToast(msg: "マイクの権限を拒否した場合、通話が利用できないためアプリを利用することができません");
      Future.delayed(const Duration(seconds: 1)).then((_) async {
        openAppSettings();
      });
      return;
    }

     */

    final iosRepository = ref.read(iosRepositoryProvider);
    await iosRepository.registStretto("login");
  }

  set strettoId(String strettoId) {
    state = state.copyWith(strettoId: strettoId);
  }

  set strettoPw(String strettoPw) {
    state = state.copyWith(strettoPw: strettoPw);
  }
}
