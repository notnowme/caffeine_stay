import 'dart:async';

import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/features/menu/models/report_with_menu_model.dart';
import 'package:caffeine_stay/features/menu/repositories/menu_repository.dart';
import 'package:caffeine_stay/features/onboard/view_models/myinfo_vm.dart';
import 'package:caffeine_stay/features/report/view_models/calc_view_models.dart';
import 'package:fl_chart/fl_chart.dart';
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

/// 몇 초마다 갱신할 건지
const homeGraphDuration = Duration(seconds: 2);

// 카페인 농도 스트림
final currentCaffeineStreamProvider = StreamProvider.autoDispose<double>((
  ref,
) async* {
  final reports = ref.watch(reportsAsyncProvider).value ?? [];
  final halfLife = ref.watch(userHalfLieftProvider) ?? 5.0;

  double initCalc() => _calculateTotal(reports, halfLife);

  // 초기값
  // 실행이 끝난 후 다음 yield를 실행한다.
  yield initCalc();

  // Stream이 종료될 때까지 실행한다.
  yield* Stream.periodic(homeGraphDuration, (count) {
    final halfLife = ref.watch(userHalfLieftProvider) ?? 5.0;

    return CaffeineCalculator.totalReaming(
      reports: reports,
      halfLife: halfLife,
    );
  });
});

/// Stream에 초기값을 넣기 위한 계산
double _calculateTotal(
  List<ReportWithMenuModel> reports,
  double halfLife,
) {
  return reports.fold(
    0,
    (prev, r) =>
        prev +
        CaffeineCalculator.singleRemaing(
          initAmount: r.menu.caffeineAmount,
          halfLife: halfLife,
          drinkTime: r.report.drinkDateAt,
        ),
  );
}

/// 선 그래프 스트림 프로바이더
final hoursChartStreamProvider = StreamProvider.autoDispose<List<FlSpot>>((
  ref,
) async* {
  ref.watch(reportsAsyncProvider);
  yield getHoursCaffeine(ref);
  yield* Stream.periodic(homeGraphDuration, (count) {
    return getHoursCaffeine(ref);
  });
});

List<FlSpot> emptySpots() {
  List<FlSpot> list = [];
  for (int i = 0; i <= 12; i++) {
    list.add(FlSpot(i.toDouble(), 0.0));
  }
  return list;
}

/// 특정 시간의 농도를 계산하기
List<FlSpot> getHoursCaffeine(Ref ref) {
  final halflife = ref.watch(userHalfLieftProvider)!;
  final now = DateTime.now();
  final allReport = ref.watch(reportsAsyncProvider).value ?? [];

  List<FlSpot> list = [];
  for (int i = 0; i <= 12; i++) {
    final target = now.subtract(Duration(hours: 12 - i));
    final amount = CaffeineCalculator.totalReaming(
      reports: allReport,
      halfLife: halflife,
      targetTime: target,
    );

    list.add(FlSpot(i.toDouble(), amount));
  }
  return list;
}

/// 선 그래프 x축 시간 갱신 프로바이더
final hoursChartTimeStreamProvider = StreamProvider.autoDispose<List<DateTime>>(
  (ref) async* {
    yield generateTimeLabels();
    yield* Stream.periodic(homeGraphDuration, (count) {
      return generateTimeLabels();
    });
  },
);

/// 현재 시간 기준으로 12시간 전 가져오기
List<DateTime> generateTimeLabels() {
  final now = DateTime.now();
  return List.generate(7, (index) {
    // 0, 2, 4, 6, 8, 10, 12시간 전 계산
    return now.subtract(Duration(hours: (6 - index) * 2));
  });
}

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
      final now = DateTime.now();
      final dayStart = DateTime(now.year, now.month, now.day);
      final result = await _repo.fetchReportByDateTime(dayStart) ?? [];
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

/// 오늘 마신 총 카페인 프로바이더
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

/// 공통적으로 사용하는 반감기 프로바이더
final userHalfLieftProvider = Provider.autoDispose((ref) {
  final myInfo = ref.watch(myInfoProvider).value;
  if (myInfo == null) return null;

  return CaffeineCalculator.getMyHalfLife(
    age: myInfo.age,
    isSmoking: myInfo.smoking,
    gender: myInfo.gender,
  );
});

/// 예상 수면 가능 시간 프로바이더
final sleepTimeProvider = StreamProvider.autoDispose<DateTime?>((ref) async* {
  final reports = ref.watch(todayCaffeineProvider).value ?? [];
  final halfLife = ref.watch(userHalfLieftProvider);
  if (halfLife == null) yield null;
  yield CaffeineCalculator.predictTime(
        reports: reports,
        halfLife: halfLife ?? 5.0,
        threshold: 50.0,
      ) ??
      DateTime.now();
  yield* Stream.periodic(homeGraphDuration, (_) {
    final reports = ref.watch(todayCaffeineProvider).value ?? [];
    final halfLife = ref.watch(userHalfLieftProvider);
    if (halfLife == null) return null;
    return CaffeineCalculator.predictTime(
          reports: reports,
          halfLife: halfLife,
          threshold: 50.0,
        ) ??
        DateTime.now();
  });
});

/// 예상 리바운드 시간 프로바이더
final reboundTimeProvider = Provider.autoDispose((ref) {
  final reports = ref.watch(reportsAsyncProvider).value ?? [];
  final halfLife = ref.watch(userHalfLieftProvider);
  if (halfLife == null) return null;

  return CaffeineCalculator.predictTime(
    reports: reports,
    halfLife: halfLife,
  );
});

/// 히트맵 데이터
Map<int, List<ReportWithMenuModel>> getHeatMapDatas(
  List<ReportWithMenuModel> reports,
) {
  final Map<int, List<ReportWithMenuModel>> datas = {};
  final now = DateTime.now();
  final todayStart = DateTime(now.year, now.month, now.day);
  for (final report in reports) {
    final drinkDate = report.report.drinkDateAt;

    final dayDiff = todayStart
        .difference(
          DateTime(drinkDate.year, drinkDate.month, drinkDate.day),
        )
        .inDays;

    if (dayDiff >= 0 && dayDiff < 7) {
      final dayIndex = 6 - dayDiff;
      final key = (dayIndex * 24) + drinkDate.hour;
      datas.putIfAbsent(key, () => []).add(report);
    }
  }
  return datas;
}

/// 히트맵 데이터 프로바이더
final heatMapDataProvider =
    FutureProvider.autoDispose<Map<int, List<ReportWithMenuModel>>?>((
      ref,
    ) async {
      final now = DateTime.now();
      final startDay = DateTime(now.year, now.month, now.day);
      final targetDay = startDay.subtract(const Duration(days: 6));

      final repo = ref.read(menuRepositoryProvider);
      final datas = await repo.fetchReportByDateTime(targetDay);
      if (datas == null) return null;
      return getHeatMapDatas(datas);
    });
