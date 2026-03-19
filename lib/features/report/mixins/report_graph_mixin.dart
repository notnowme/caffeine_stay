import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const weekDayList = ['', '월', '화', '수', '목', '금', '토', '일'];

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

  String weekText(int day) {
    final now = DateTime.now();
    final targetDate = now.subtract(Duration(days: 6 - day));

    return weekDayList[targetDate.weekday];
  }

  String monthText(int index) {
    final now = DateTime.now();
    final targetDate = now.subtract(Duration(days: 29 - index));
    return '${targetDate.day}일';
  }

  Widget getWeeklyTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      // space: context.h(8),
      child: Text(
        weekText(value.toInt()),
        style: PretendardText.caption1.copyWith(
          color: value.toInt() == 6
              ? AppColor.primaryColor
              : AppColor.descColor,
          fontWeight: value.toInt() == 6 ? FontWeight.w800 : FontWeight.w500,
        ),
      ),
    );
  }

  Widget getMontlyTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      // space: context.h(8),
      child: Text(
        monthText(value.toInt()),
        style: PretendardText.caption1.copyWith(
          color: value.toInt() == 29
              ? AppColor.primaryColor
              : AppColor.descColor,
          fontWeight: value.toInt() == 29 ? FontWeight.w800 : FontWeight.w500,
        ),
      ),
    );
  }
}
