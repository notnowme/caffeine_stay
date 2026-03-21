import 'package:caffeine_stay/common/providers/notify_provider.dart';
import 'package:caffeine_stay/features/home/providers/caffeine_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeEvent {
  /// 카페인 추가를 감시해서 리바운드 알림 시간 덮어씌우기
  /// 홈은 무조건 거치므로 앱을 껐다가 켰을 때도 적용될 듯.
  Future<void> rewriteNotify(WidgetRef ref) async {
    final now = DateTime.now();
    final reboundTime = ref.read(reboundTimeProvider);
    final localNotifter = ref.read(localNotifyProvider.notifier);
    if (reboundTime != null && reboundTime.isAfter(now)) {
      localNotifter.send(
        title: '카페인 리바운드 알림.',
        body: '카페인이 떨어지고 있어요. 휴식을 취해 보세요.',
        reoubndTime: reboundTime,
      );
    }
  }
}
