import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

mixin class ReportWriteGraph {
  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double barWidth = 22,
    List<int> showTooltips = const [],
    double graphStatrWidth = 20,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
          ),
          // 탭하고 있으면 값을 살짝 증가시키기
          toY: isTouched && y >= 10 ? y + 10 : y,

          color: isTouched
              ? AppColor.primaryColor
              : AppColor.primaryColor.withValues(alpha: 0.2),

          width: barWidth,
          // borderSide: isTouched
          //     ? BorderSide(color: AppColor.primaryColor.)
          //     : const BorderSide(width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: graphStatrWidth,
            color: AppColor.primaryColor.withValues(alpha: 0.5),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
