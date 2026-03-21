part of '../home_screen.dart';

class _CaffeineChart extends ConsumerWidget {
  const _CaffeineChart();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spots = ref.watch(hoursChartStreamProvider);
    return SizedBox(
      height: context.h(200),
      child: LineChart(
        duration: const Duration(milliseconds: 300),
        curve: const Cubic(0.64, 0.34, 0.46, 0.82),
        LineChartData(
          minX: 0,
          maxX: 12,
          minY: 0,
          maxY: 400 * 1.1,

          extraLinesData: ExtraLinesData(
            // x나 y축 보조선 표시
            extraLinesOnTop: false,
            horizontalLines: [
              HorizontalLine(
                y: 400.toDouble(),
                dashArray: [
                  // 점선 길이
                  2,
                ],
                color: AppColor.primaryColor.withValues(alpha: 0.5),
                label: HorizontalLineLabel(
                  show: true,
                  alignment: Alignment.topRight,
                  style: PretendardText.caption2.copyWith(
                    color: AppColor.primaryColor.withValues(alpha: 0.5),
                  ),
                  labelResolver: (p0) {
                    return '성인 하루 권장량'; // 선 위에 글자 표시
                  },
                ),
              ),
            ],
          ),

          // 터치 시 데이터 표시
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
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
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((e) {
                  String amount = e.y.toStringAsFixed(0);
                  return LineTooltipItem(
                    '${amount}mg',
                    PretendardText.caption1.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  );
                }).toList();
              },
            ),
          ),

          // 그래프 둘러싸는 선
          borderData: FlBorderData(show: false),

          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots.value ?? emptySpots(),
              isCurved: true,
              // 급격한 데이터 변화 시 선이 아래로 튀는 것 방지?
              preventCurveOverShooting: true,
              curveSmoothness: 0.1,
              isStrokeJoinRound: true,
              isStrokeCapRound: true,
              color: AppColor.primaryColor,
              barWidth: 3,
              // 값의 점 표시
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, bar, index) {
                  if (index == bar.spots.length - 1) {
                    // 마지막 값을 시 점을 표시
                    return FlDotCirclePainter(
                      radius: context.r(4),
                      color: AppColor.primaryColor,
                      strokeColor: AppColor.primaryColor.withValues(alpha: 0.1),
                    );
                  }
                  return FlDotCirclePainter(radius: 0);
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                color: AppColor.primaryColor.withValues(alpha: 0.1),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // 선의 바로 밑 잘 보이게
                    AppColor.primaryColor.withValues(alpha: 0.8),

                    // 선의 끝 투명
                    AppColor.primaryColor.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
