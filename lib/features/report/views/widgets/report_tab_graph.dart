part of '../report_screen.dart';

class _TabGraph extends StatefulWidget {
  const _TabGraph();

  @override
  State<_TabGraph> createState() => __TabGraphState();
}

class __TabGraphState extends State<_TabGraph> with ReportWriteGraph {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    // final now = DateTime.now();

    List<BarChartGroupData> showingGroups() => List.generate(
      7,
      (i) => switch (i) {
        0 => makeGroupData(
          0,
          5,
          isTouched: i == touchedIndex,
          barWidth: context.w(34),
          graphStatrWidth: 0,
        ),
        1 => makeGroupData(
          1,
          0,
          isTouched: i == touchedIndex,
          barWidth: context.w(34),
          graphStatrWidth: 0,
        ),
        2 => makeGroupData(
          2,
          10,
          isTouched: i == touchedIndex,
          barWidth: context.w(34),
          graphStatrWidth: 0,
        ),
        3 => makeGroupData(
          3,
          80,
          isTouched: i == touchedIndex,
          barWidth: context.w(34),
          graphStatrWidth: 0,
        ),
        4 => makeGroupData(
          4,
          12,
          isTouched: i == touchedIndex,
          barWidth: context.w(34),
          graphStatrWidth: 0,
        ),
        5 => makeGroupData(
          5,
          150,
          isTouched: i == touchedIndex,
          barWidth: context.w(34),
          graphStatrWidth: 0,
        ),
        6 => makeGroupData(
          6,
          300,
          isTouched: i == touchedIndex,
          barWidth: context.w(34),
          graphStatrWidth: 0,
        ),
        _ => throw Error(),
      },
    );
    Widget getTitles(double value, TitleMeta meta) {
      String text = switch (value.toInt()) {
        0 => '월',
        1 => '화',
        2 => '수',
        3 => '목',
        4 => '금',
        5 => '토',
        6 => '일',
        _ => '',
      };
      return SideTitleWidget(
        meta: meta,
        space: context.h(8),
        child: Text(
          text,
          style: PretendardText.caption1.copyWith(color: AppColor.primaryColor),
        ),
      );
    }

    return Container(
      margin: context.edgeInsets(
        horizontal: context.w(16),
      ),
      height: context.h(210),
      decoration: BoxDecoration(
        color: AppColor.secondaryColor.withValues(alpha: 0.5),
        border: Border.all(
          color: AppColor.primaryColor.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(context.r(16)),
        ),
      ),
      child: BarChart(
        duration: const Duration(milliseconds: 200),
        curve: const Cubic(0.64, 0.34, 0.46, 0.82),
        BarChartData(
          minY: 0,
          maxY: 300 * 1.1,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => Colors.white,
              tooltipBorder: BorderSide(
                width: 2,
                color: AppColor.primaryColor.withValues(alpha: 0.2),
              ),
              tooltipHorizontalAlignment: FLHorizontalAlignment.center,
              tooltipPadding: context.edgeInsets(
                horizontal: context.w(8),
                vertical: context.h(4),
              ),
              tooltipMargin: context.h(5),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String weekDay = switch (group.x) {
                  0 => '월요일',
                  1 => '화요일',
                  2 => '수요일',
                  3 => '목요일',
                  4 => '금요일',
                  5 => '토요일',
                  6 => '일요일',
                  _ => throw Error(),
                };
                return BarTooltipItem(
                  '$weekDay\n',
                  PretendardText.caption1.copyWith(
                    color: AppColor.primaryColor,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '${((rod.toY >= 10 ? rod.toY - 10 : rod.toY).toStringAsFixed(0)).toString()}mg',
                      style: PretendardText.caption2,
                    ),
                  ],
                );
              },
            ),
            touchCallback: (event, barTouchRes) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    barTouchRes == null ||
                    barTouchRes.spot == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = barTouchRes.spot!.touchedBarGroupIndex;
              });
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getTitles,
                reservedSize: 38,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: showingGroups(),
          gridData: const FlGridData(show: false),
        ),
      ),
    );
  }
}
