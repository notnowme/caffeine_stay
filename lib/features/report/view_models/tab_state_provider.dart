import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabStateNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void change(int tabIndex) {
    state = tabIndex;
  }
}

final reportTabStateProvider = NotifierProvider.autoDispose(
  () => TabStateNotifier(),
);
