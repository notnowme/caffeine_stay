import 'dart:async';

import 'package:caffeine_stay/common/repositories/info_repository.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:caffeine_stay/features/onboard/view_models/myinfo_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class MyInfoState {
  AsyncValue<MyInfoModel> watchInfo(WidgetRef ref) => ref.watch(myInfoProvider);

  // select를 쓰면 특정 값 변화만 바라본다
  Gender watchGender(WidgetRef ref) => ref.watch(
    myInfoProvider.select((info) {
      return info.value?.gender ?? Gender.male;
    }),
  );

  double watchWeight(WidgetRef ref) => ref.watch(
    myInfoProvider.select((info) {
      return info.value?.weight ?? 70.0;
    }),
  );

  int watchAge(WidgetRef ref) => ref.watch(
    myInfoProvider.select((info) {
      return info.value?.age ?? 17;
    }),
  );

  bool watchSmoking(WidgetRef ref) => ref.watch(
    myInfoProvider.select((info) {
      return info.value?.smoking ?? false;
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

  // FutureOr<void> getMyInfo(WidgetRef ref) async {
  //   ref.read(myInfoProvider.notifier).getMyInfo();
  // }

  Future<void> read(WidgetRef ref) async {
    final repo = ref.read(infoRepositoryProvider);
    final myinfo = ref.read(myInfoProvider).value!;
    await repo.saveMyInfo(myinfo);
  }
}
