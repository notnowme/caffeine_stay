import 'dart:async';

import 'package:caffeine_stay/common/repositories/info_repository.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:caffeine_stay/features/onboard/view_models/myinfo_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class MyInfoState {
  MyInfoModel watchInfo(WidgetRef ref) => ref.watch(myInfoProvider);

  // select를 쓰면 특정 값 변화만 바라본다
  Gender watchGender(WidgetRef ref) => ref.watch(
    myInfoProvider.select((MyInfoModel info) {
      return info.gender;
    }),
  );

  double watchWeight(WidgetRef ref) => ref.watch(
    myInfoProvider.select((MyInfoModel info) {
      return info.weight;
    }),
  );

  int watchAge(WidgetRef ref) => ref.watch(
    myInfoProvider.select((MyInfoModel info) {
      return info.age;
    }),
  );

  bool watchSmoking(WidgetRef ref) => ref.watch(
    myInfoProvider.select((MyInfoModel info) {
      return info.smoking;
    }),
  );
}

mixin class MyInfoEvent {
  void setGender(WidgetRef ref, Gender g) {
    ref.read(myInfoProvider.notifier).updateGender(g);
  }

  void setWeight(WidgetRef ref, double w) {
    ref.read(myInfoProvider.notifier).updateWeight(w);
  }

  void setAge(WidgetRef ref, int a) {
    ref.read(myInfoProvider.notifier).updateAge(a);
  }

  void setSmoking(WidgetRef ref, bool s) {
    ref.read(myInfoProvider.notifier).updateSmoking(s);
  }

  void clearInfo(WidgetRef ref) {
    ref.read(myInfoProvider.notifier).clear();
  }

  FutureOr<void> getMyInfo(WidgetRef ref) async {
    ref.read(myInfoProvider.notifier).getMyInfo();
  }

  Future<void> read(WidgetRef ref) async {
    final repo = ref.read(infoRepositoryProvider);
    final myinfo = ref.read(myInfoProvider);
    await repo.saveMyInfo(myinfo);
  }
}
