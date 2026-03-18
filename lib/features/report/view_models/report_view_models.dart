import 'dart:async';

import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/features/menu/models/report_with_menu_model.dart';
import 'package:caffeine_stay/features/menu/repositories/menu_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportFamilyAsyncNotifier
    extends AsyncNotifier<List<ReportWithMenuModel>> {
  late final MenuRepository _repo;

  ReportFamilyAsyncNotifier(this.duration);

  final Duration duration;
  double prevAmount = 0.0;

  @override
  FutureOr<List<ReportWithMenuModel>> build() async {
    _repo = ref.read(menuRepositoryProvider);

    final result = await AsyncValue.guard(() => _fetchReports());

    if (state.hasError) {
      _updateGlobalError();
    }

    return result.value ?? [];
  }

  Future<List<ReportWithMenuModel>> _fetchReports() async {
    try {
      return await _repo.fetchReportByDate(duration) ?? [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ReportWithMenuModel>> getBetweenDateData(Duration start) async {
    try {
      return await _repo.getDataBetweenDate(start, duration) ?? [];
    } catch (e) {
      rethrow;
    }
  }

  double addCaffeineAmount() {
    return calcCaffeineAmount(state.value ?? []);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchReports());
    if (state.hasError) {
      _updateGlobalError();
    }
  }

  void _updateGlobalError() {
    final error = CustomNetworkError(
      title: '데이터 오류',
      message: '기록 데이터를 찾지 못했습니다.',
      path: '',
    );
    ref.read(errorProvider.notifier).updateError(error);
  }
}

final reportFamilyAsyncProvider = AsyncNotifierProvider.autoDispose
    .family<ReportFamilyAsyncNotifier, List<ReportWithMenuModel>, Duration>(
      ReportFamilyAsyncNotifier.new,
    );

Future<double> calcIncreRate(double current, double prev) async {
  if (prev.toInt() == 0) {
    return current.toInt() > 0 ? 100.0 : 0.0;
  }
  final rate = ((current - prev) / prev) * 100;
  return rate;
}

double calcCaffeineAmount(List<ReportWithMenuModel> list) {
  double total = 0.0;
  if (list.isNotEmpty) {
    for (final report in list) {
      total += report.menu.caffeineAmount;
    }
    return total;
  }
  return total;
}

final caffeineDiffProvider = FutureProvider.autoDispose
    .family<double, Duration>((ref, duration) async {
      final notifier = ref.read(reportFamilyAsyncProvider(duration).notifier);
      final current = notifier.addCaffeineAmount();
      final prev = await notifier.getBetweenDateData(duration * 2);
      double total = calcCaffeineAmount(prev);

      return calcIncreRate(current, total);
    });
