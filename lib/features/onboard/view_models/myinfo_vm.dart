import 'dart:async';

import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/common/providers/secure_storage_provider.dart';
import 'package:caffeine_stay/common/repositories/info_repository.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:caffeine_stay/features/settings/views/pages/info/settings_info_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoViewModel extends AsyncNotifier<MyInfoModel> {
  late final InfoRepository _repo;
  @override
  build() async {
    _repo = ref.read(infoRepositoryProvider);
    return await _getMyInfo() ?? MyInfoModel.empty();
  }

  FutureOr<MyInfoModel?> _getMyInfo() async {
    try {
      final storage = ref.read(secureStorageProvider);
      final isFirstTime = await storage.read(key: 'isFirstTime');
      if (isFirstTime == null || isFirstTime == 'true') {
        return null;
      }
      final my = await _repo.getMyInfo();
      if (my != null) {
        return my;
      } else {
        throw Exception('회원 정보를 가져오지 못했습니다.');
      }
    } catch (e) {
      final error = CustomOthersError(
        title: '에러',
        message: '$e',
        path: SettingsInfoScreen.routeName,
      );
      ref.read(errorProvider.notifier).updateError(error);
    }
    return null;
  }

  void updateGender(Gender g) {
    state = AsyncValue.data(
      state.value!.copyWith(gender: g),
    );
  }

  void updateWeight(double w) {
    state = AsyncValue.data(
      state.value!.copyWith(weight: w),
    );
  }

  void updateAge(int a) {
    state = AsyncValue.data(
      state.value!.copyWith(age: a),
    );
  }

  void updateSmoking(bool s) {
    state = AsyncValue.data(
      state.value!.copyWith(smoking: s),
    );
  }

  void clear() {
    state = AsyncValue.data(MyInfoModel.empty());
  }
}

final myInfoProvider =
    AsyncNotifierProvider.autoDispose<MyInfoViewModel, MyInfoModel>(
      () {
        return MyInfoViewModel();
      },
    );
