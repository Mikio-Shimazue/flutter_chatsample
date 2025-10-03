import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faxnavigation_state.freezed.dart';

//https://zenn.dev/kazutxt/books/flutter_practice_introduction/viewer/advanced_freezed

@freezed
class FaxNavigationState with _$FaxNavigationState {
  const factory FaxNavigationState({required int currentIndex}) =
      _FaxNavigationState;
}

class FaxNavigationController extends StateNotifier<FaxNavigationState> {
  FaxNavigationController(this.ref)
      : super(const FaxNavigationState(currentIndex: 0));

  Ref ref;

  Future<void> load() async {}

  set currentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
