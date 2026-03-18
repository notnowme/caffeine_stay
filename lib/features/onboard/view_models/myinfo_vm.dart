import 'dart:async';

import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/common/repositories/info_repository.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:caffeine_stay/features/settings/views/pages/info/settings_info_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoViewModel extends Notifier<MyInfoModel> {
  late final InfoRepository _repo;
  @override
  build() {
    _repo = ref.read(infoRepositoryProvider);
    return const MyInfoModel(
      gender: Gender.male,
      weight: 70,
      age: 25,
      smoking: false,
    );
  }

  FutureOr<void> getMyInfo() async {
    try {
      final my = await _repo.getMyInfo();
      if (my != null) {
        state = my;
      } else {
        final error = CustomUserError(
          title: '오류',
          message: '회원 정보를 가져오지 못했습니다.',
          path: SettingsInfoScreen.routeName,
        );
        ref.read(errorProvider.notifier).updateError(error);
      }
    } catch (e) {
      final error = CustomOthersError(
        title: '에러',
        message: '$e',
        path: SettingsInfoScreen.routeName,
      );
      ref.read(errorProvider.notifier).updateError(error);
    }
  }

  void updateGender(Gender g) {
    state = state.copyWith(gender: g);
  }

  void updateWeight(double w) {
    state = state.copyWith(weight: w);
  }

  void updateAge(int a) {
    state = state.copyWith(age: a);
  }

  void updateSmoking(bool s) {
    state = state.copyWith(smoking: s);
  }

  void clear() {
    state = const MyInfoModel(
      gender: Gender.male,
      weight: 70,
      age: 25,
      smoking: false,
    );
  }
}

final myInfoProvider =
    NotifierProvider.autoDispose<MyInfoViewModel, MyInfoModel>(
      () {
        return MyInfoViewModel();
      },
    );

final myInfoSettingsProvider =
    NotifierProvider.autoDispose<MyInfoViewModel, MyInfoModel>(
      () {
        return MyInfoViewModel();
      },
    );
