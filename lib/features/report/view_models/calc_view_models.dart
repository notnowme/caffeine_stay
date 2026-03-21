import 'dart:math' as math;

import 'package:caffeine_stay/features/menu/models/report_with_menu_model.dart';

class CaffeineCalculator {
  static double getMyHalfLife({
    required bool isSmoking,
    required int age,
    bool isPregnant = false,
  }) {
    // 임신 여부
    if (isPregnant) return 12.0;

    // 흡연
    if (isSmoking) return 3.0;

    // 나이
    if (age >= 65) return 7.5;

    return 5.0;
  }

  static double singleRemaing({
    required double initAmount,
    required DateTime drinkTime,
    required double halfLife,
    DateTime? targetTime,
  }) {
    final now = targetTime ?? DateTime.now();
    final hours = now.difference(drinkTime).inMinutes / 60.0;

    // 마시기 전이라면 0.0
    if (hours < 0) return 0.0;

    if (hours < 0.5) {
      // 30분 동안은 선형적으로 증가한다.
      return initAmount * (hours / 0.5);
    } else {
      // 30분 후 지수적으로 감소
      return initAmount * math.pow(0.5, (hours - 0.5) / halfLife);
    }
  }

  static double totalReaming({
    required List<ReportWithMenuModel> reports,
    required double halfLife,
    DateTime? targetTime,
  }) {
    final now = targetTime ?? DateTime.now();

    return reports.fold(0.0, (sum, report) {
      return sum +
          singleRemaing(
            initAmount: report.menu.caffeineAmount,
            drinkTime: report.report.drinkDateAt,
            halfLife: halfLife,
            targetTime: now,
          );
    });
  }

  static DateTime? predictTime({
    required List<ReportWithMenuModel> reports,
    required double halfLife,
    double threshold = 10.0,
  }) {
    if (reports.isEmpty) return null;

    // 마지막으로 마신 카페인 흡수 완료 시간
    DateTime checkTime = reports.last.report.drinkDateAt.add(
      const Duration(minutes: 30),
    );

    // 기준치보다 낮으면 끝내기
    double initAmount = CaffeineCalculator.totalReaming(
      reports: reports,
      halfLife: halfLife,
      targetTime: checkTime,
    );

    if (initAmount <= threshold) return null;

    // 10분씩 추가하면서 예상하기
    // 24시간 * 6번(10분 단위)
    for (int i = 0; i < 24 * 6; i++) {
      checkTime = checkTime.add(
        const Duration(minutes: 10),
      );

      double currentToal = CaffeineCalculator.totalReaming(
        reports: reports,
        halfLife: halfLife,
        targetTime: checkTime,
      );

      // 기준치 이하가 되는 첫 번째 시간
      if (currentToal <= threshold) {
        return checkTime;
      }
    }
    // 24시간 내에 떨어지지 않는다면
    return null;
  }
}
