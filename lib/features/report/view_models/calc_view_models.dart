import 'dart:math';

import 'package:caffeine_stay/features/menu/models/report_with_menu_model.dart';

class CaffeineCalc {
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

  static double calcRemainig({
    required ReportWithMenuModel reports,
    required double halfLife,
    DateTime? date,
  }) {
    final targetTime = date ?? DateTime.now();
    final hours =
        targetTime.difference(reports.report.drinkDateAt).inMinutes / 60.0;

    double result;

    // 섭취 후 30분은 선형적 증가한다고 함.
    if (hours < 0.5) {
      result = reports.menu.caffeineAmount * (hours / 0.5);
    } else {
      // 30분 후 반감기가 적용한다는 듯.
      final decayHours = hours - 0.5;
      result = reports.menu.caffeineAmount * pow(0.5, decayHours / halfLife);
    }

    return result < 1.0 ? 0.0 : result;
  }

  static double calcRemainigAt({
    required List<ReportWithMenuModel> reports,
    required double halfLife,
    DateTime? date,
  }) {
    final targetTime = date ?? DateTime.now();
    return reports.fold(0.0, (sum, r) {
      // if (r.report.drinkDateAt.isAfter(targetTime)) return sum;
      return sum +
          CaffeineCalc.calcRemainig(
            reports: r,
            halfLife: halfLife,
            date: targetTime,
          );
    });
  }
}
