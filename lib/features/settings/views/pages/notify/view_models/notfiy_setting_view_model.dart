import 'dart:async';

import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/common/providers/notify_provider.dart';
import 'package:caffeine_stay/common/providers/secure_storage_provider.dart';
import 'package:caffeine_stay/features/settings/views/pages/notify/models/notify_setting_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class NotifySettingNotifier extends AsyncNotifier<NotifySettingModel> {
  @override
  FutureOr<NotifySettingModel> build() async {
    return await _getNotifySetting();
  }

  Future<NotifySettingModel> _getNotifySetting() async {
    final storage = ref.read(secureStorageProvider);
    final notifies = await Future.wait([
      storage.read(key: 'rebound'),
      storage.read(key: 'hydrate'),
    ]);
    final reboundNotify = notifies[0] ?? 'false';
    final hydrateNotify = notifies[1] ?? 'false';
    return NotifySettingModel(
      rebound: reboundNotify == 'true' ? true : false,
      hydrate: hydrateNotify == 'true' ? true : false,
    );
  }

  Future<bool> checkPermission() async {
    final notifyStatus = await Permission.notification.status;
    return notifyStatus == PermissionStatus.granted;
  }

  void toggleRebound(bool rebound) async {
    final status = await checkPermission();
    // TODO 권한 재설정 요구하기
    if (!status) return;
    state = AsyncValue.data(state.value!.copyWith(rebound: rebound));
    final storage = ref.read(secureStorageProvider);
    await storage.write(
      key: 'rebound',
      value: rebound ? 'true' : 'false',
    );
    final notifier = ref.read(localNotifyProvider.notifier);
    notifier.cancelNotify(998);
  }

  void toggleHydrate(bool hydrate) async {
    final status = await checkPermission();
    // TODO 권한 재설정 요구하기
    if (!status) return;
    state = AsyncValue.data(state.value!.copyWith(hydrate: hydrate));
    final storage = ref.read(secureStorageProvider);
    await storage.write(
      key: 'hydrate',
      value: hydrate ? 'true' : 'false',
    );
    final notifier = ref.read(localNotifyProvider.notifier);
    notifier.cancelNotify(999);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _getNotifySetting());
    if (state.hasError) {
      final error = CustomUserError(
        title: '에러',
        message: '알림 정보를 가져오지 못했습니다.',
        path: '',
      );
      ref.read(errorProvider.notifier).updateError(error);
    }
  }
}

final notifySettingProvider = AsyncNotifierProvider.autoDispose(
  () => NotifySettingNotifier(),
);
