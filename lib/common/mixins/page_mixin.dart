import 'package:caffeine_stay/common/providers/page_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class PageEvent {
  void pageMove(WidgetRef ref, int page) {
    ref.read(pageProvider.notifier).move(page);
  }

  void goHome(WidgetRef ref) {
    ref.read(pageProvider.notifier).goHome();
  }
}
