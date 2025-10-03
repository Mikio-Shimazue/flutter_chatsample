import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatnavigation_state.freezed.dart';

//https://zenn.dev/kazutxt/books/flutter_practice_introduction/viewer/advanced_freezed

@freezed
class ChatNavigationState with _$ChatNavigationState {
  const factory ChatNavigationState({required int currentIndex}) =
      _ChatNavigationState;
}

class ChatNavigationController extends StateNotifier<ChatNavigationState> {
  ChatNavigationController(this.ref)
      : super(const ChatNavigationState(currentIndex: 0));

  Ref ref;

  Future<void> load() async {}

  set currentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
