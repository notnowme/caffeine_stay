import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void move(int page) {
    state = page;
  }

  void goHome() {
    state = 0;
  }
}

final pageProvider = NotifierProvider(() {
  return PageNotifier();
});
