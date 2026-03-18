import 'dart:async';

import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/features/menu/models/report_with_menu_model.dart';
import 'package:caffeine_stay/features/menu/repositories/menu_repository.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:caffeine_stay/features/onboard/view_models/myinfo_vm.dart';
import 'package:caffeine_stay/features/report/view_models/calc_view_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportsAsyncNotifier extends AsyncNotifier<List<ReportWithMenuModel>> {
  late final MenuRepository _repo;

  @override
  FutureOr<List<ReportWithMenuModel>> build() async {
    _repo = ref.read(menuRepositoryProvider);
    return await _fetchReports();
  }

  Future<List<ReportWithMenuModel>> _fetchReports() async {
    try {
      // 약 48시간 동안 미량의 카페인이 남아있다고 함.
      return await _repo.fetchReportByDate(const Duration(hours: 48)) ?? [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchReports());
    if (state.hasError) {
      final error = CustomNetworkError(
        title: '데이터 오류',
        message: '기록 데이터를 찾지 못했습니다.',
        path: '',
      );
      ref.read(errorProvider.notifier).updateError(error);
    }
  }
}

final reportsAsyncProvider = AsyncNotifierProvider.autoDispose(
  () => ReportsAsyncNotifier(),
);

// Stream에 초기값을 넣기 위한 계산
double _calculateTotal(List<ReportWithMenuModel> reports, MyInfoModel my) {
  final halflife = CaffeineCalc.getMyHalfLife(
    isSmoking: my.smoking,
    age: my.age,
  );
  return reports.fold(
    0,
    (prev, r) =>
        prev + CaffeineCalc.calcRemainig(reports: r, halfLife: halflife),
  );
}

// 카페인 농도 스트림
final currentCaffeineStreamProvider = StreamProvider.autoDispose<double>((
  ref,
) async* {
  final reports = ref.watch(reportsAsyncProvider).value ?? [];
  final my = ref.watch(myInfoProvider);

  double initCalc() => _calculateTotal(reports, my);

  // 초기값
  // 실행이 끝난 후 다음 yield를 실행한다.
  yield initCalc();

  // Stream이 종료될 때까지 실행한다.
  yield* Stream.periodic(const Duration(minutes: 1), (count) {
    final halflife = CaffeineCalc.getMyHalfLife(
      isSmoking: my.smoking,
      age: my.age,
    );

    double total = 0;
    for (final report in reports) {
      total += CaffeineCalc.calcRemainig(
        reports: report,
        halfLife: halflife,
      );
    }
    return total;
  });
});

class TodayCaffineAsyncNotifier
    extends AsyncNotifier<List<ReportWithMenuModel>> {
  late final MenuRepository _repo;
  @override
  FutureOr<List<ReportWithMenuModel>> build() async {
    _repo = ref.read(menuRepositoryProvider);
    return await _fetchTodayReports();
  }

  Future<List<ReportWithMenuModel>> _fetchTodayReports() async {
    try {
      final result =
          await _repo.fetchReportByDate(const Duration(hours: 24)) ?? [];
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchTodayReports());
    if (state.hasError) {
      final error = CustomNetworkError(
        title: '데이터 오류',
        message: '기록 데이터를 찾지 못했습니다.',
        path: '',
      );
      ref.read(errorProvider.notifier).updateError(error);
    }
  }
}

final todayCaffeineProvider = AsyncNotifierProvider.autoDispose(
  () => TodayCaffineAsyncNotifier(),
);

final todayCaffeineAmountProvider = FutureProvider.autoDispose((ref) {
  final reports = ref.watch(todayCaffeineProvider).value ?? [];
  double total = 0.0;
  if (reports.isEmpty) {
    return total;
  } else {
    for (final r in reports) {
      total += r.menu.caffeineAmount;
    }
    return total;
  }
});
