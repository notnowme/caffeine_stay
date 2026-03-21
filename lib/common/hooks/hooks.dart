import 'dart:async';
import 'dart:io';

import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/common/providers/secure_storage_provider.dart';
import 'package:caffeine_stay/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer(this.delay);

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

void errorUpdate(CustomError e) {
  final ref = globalContainer;
  ref.read(errorProvider.notifier).updateError(e);
}

@pragma('vm:entry-point')
void onDidReceiveBackgroundNotificationResponse(NotificationResponse details) {
  print('백그라운드 알림 클릭 ID: ${details.id}');
}

Future<void> initNotify() async {
  final flutterLocalNotify = FlutterLocalNotificationsPlugin();
  await flutterLocalNotify
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(
        const AndroidNotificationChannel(
          'high_importance_channel',
          'high_importance_notification',
          importance: Importance.max,
        ),
      );
  await flutterLocalNotify.initialize(
    settings: const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
      ),
    ),
    onDidReceiveNotificationResponse: (details) {
      debugPrint('=== [onDidReceiveNotificationRespoonse] ===');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        debugPrint('알림 누르면 이동인가...?');
      });
    },
    onDidReceiveBackgroundNotificationResponse:
        onDidReceiveBackgroundNotificationResponse,
  );

  final permissionStatus = await checkNotifyPermission();
  if (permissionStatus) return;

  bool? status;

  if (Platform.isAndroid) {
    status = await flutterLocalNotify
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  } else {
    status = await flutterLocalNotify
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
  final storage = globalContainer.read(secureStorageProvider);
  await storage.write(
    key: 'rebound',
    value: status ?? false ? 'true' : 'false',
  );
  await storage.write(
    key: 'hydrate',
    value: status ?? false ? 'true' : 'false',
  );
}

Future<bool> checkNotifyPermission() async {
  PermissionStatus status = await Permission.notification.status;
  return status == PermissionStatus.granted;
}
