part of '../report_screen.dart';

class _TabGraph extends ConsumerStatefulWidget {
  const _TabGraph();

  @override
  ConsumerState<_TabGraph> createState() => __TabGraphState();
}

class __TabGraphState extends ConsumerState<_TabGraph> with ReportWriteGraph {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final isWeek = ref.watch(reportTabStateProvider) == 0;

    final amountList =
        ref.watch(reportGraphDataProvider(isWeek ? 7 : 30)).value ?? [];

    List<BarChartGroupData> showing() => List.generate(amountList.length, (i) {
      return makeGroupData(
        i,
        amountList[i],
        isTouched: i == touchedIndex,
        barWidth: isWeek ? context.w(34) : context.w(34),
        graphStatrWidth: 0,
      );
    });

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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: isWeek ? (7 * context.w(50)) : (30 * context.w(50)),
          height: context.h(210),
          child: BarChart(
            duration: const Duration(milliseconds: 200),
            curve: const Cubic(0.64, 0.34, 0.46, 0.82),
            BarChartData(
              minY: 0,
              maxY: 400 * 1.1,
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
                    String weekDay = isWeek
                        ? '${weekText(group.x.toInt())}요일'
                        : monthText(group.x.toInt());

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
                    getTitlesWidget: isWeek ? getWeeklyTitles : getMontlyTitles,
                    reservedSize: 38,
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: showing(),
              gridData: const FlGridData(show: false),
            ),
          ),
        ),
      ),
    );
  }
}
