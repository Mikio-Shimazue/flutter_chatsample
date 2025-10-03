import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  //static const platform = MethodChannel('jp')

  final Reader read;

  AppState(this.read);

  //  初期取得処理
  Future<void> load() async {}
}
