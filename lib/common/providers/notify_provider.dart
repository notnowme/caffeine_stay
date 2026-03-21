import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifyNotifer extends Notifier<void> {
  late FlutterLocalNotificationsPlugin _plugin;

  @override
  void build() {
    _plugin = FlutterLocalNotificationsPlugin();
  }

  void cancelNotify(int id) {
    _plugin.cancel(id: id);
  }

  Future<List<PendingNotificationRequest>> checkMyNotify() async {
    return await _plugin.pendingNotificationRequests();
  }

  Future<void> send({
    required String title,
    required String body,
    required DateTime reoubndTime,
    String payload = '',
  }) async {
    // final status = await checkMyNotify();
    // if (!status) return;
    // 혹시 모를 남아있을 알림을 취소
    // _plugin.cancel(id: 999);
    final sendTime = tz.TZDateTime.from(reoubndTime, tz.local);
    print(sendTime);
    print('notify applied');
    _plugin.zonedSchedule(
      id: 999,
      title: title,
      body: body,
      scheduledDate: sendTime,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'high_importance_notification',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true, // 앱이 켜져있을 때도 보여줄지
          presentSound: true, // 소리 재생
          presentBadge: true, // 앱 아이콘 배지 표시 여부
          badgeNumber: 1, // 배지 숫자
        ),
      ),
      payload: payload,
    );
  }
}

final localNotifyProvider = NotifierProvider.autoDispose(
  () => LocalNotifyNotifer(),
);
