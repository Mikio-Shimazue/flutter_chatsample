import 'package:chatsample/chat/ui/navigation/chatnavigation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chatsample/share/ui/login/login_state.dart';
//import  'package:chatsample/fax/ui/navigation/sub/faxreceivelist/faxreceivelist_state.dart';
import 'package:chatsample/fax/ui/navigation/faxnavigation_state.dart';
import 'package:chatsample/fax/ui/navigation/sub/faxreceivelist_state.dart';
import 'package:chatsample/share/repository/ios/ios_repository.dart';
import 'package:chatsample/chat/ui/navigation/sub/chatroomlist/chatroomlist_state.dart';

//  login
final loginControllerProvider = StateNotifierProvider<LoginController,LoginState>((ref) => LoginController(ref));
//  ListPage
final faxReceiveListIsControllProvider = StateNotifierProvider <
    FaxReceiveListController,
    FaxReceiveListState>((ref) => FaxReceiveListController(ref));

//  Chat Room List
final chatRoomListIsControllProvider = StateNotifierProvider<ChatRoomListController,ChatRoomListState>((ref) => ChatRoomListController(ref));
final faxNavigationControllerProvider = StateNotifierProvider<
    FaxNavigationController,
    FaxNavigationState>((ref) => FaxNavigationController(ref));

final chatNavigationControllerProvider = StateNotifierProvider<
    ChatNavigationController,
    ChatNavigationState>((ref) => ChatNavigationController(ref));

//  repository
final iosRepositoryProvider = Provider((ref) => IosRepository(ref));

//  画面ローディング用
final loginIsLoadedProvider = StateProvider.autoDispose<bool>((ref)=>false);
final navigateIsLoadedProvider = StateProvider.autoDispose<bool>((
    ref) => false);
final faxReceiveListIsLoadedProvider = StateProvider.autoDispose<bool>((
    ref) => false);
final chatRoomListLoadedProvider = StateProvider.autoDispose<bool>((ref)=>false);