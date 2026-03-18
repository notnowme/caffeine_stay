part of '../home_screen.dart';

List<FlSpot> getSixHourSpots() {
  final now = DateTime.now();
  double hourAgo(int mins) =>
      now.subtract(Duration(minutes: mins)).millisecondsSinceEpoch.toDouble();

  return [
    FlSpot(hourAgo(720), 20),
    FlSpot(hourAgo(500), 120),
    FlSpot(hourAgo(450), 80),
    FlSpot(hourAgo(400), 100),
    FlSpot(hourAgo(380), 200),
    FlSpot(hourAgo(370), 180),
    FlSpot(hourAgo(360), 160),
    FlSpot(hourAgo(300), 120),
    FlSpot(hourAgo(180), 80),
    FlSpot(hourAgo(120), 100),
    FlSpot(hourAgo(60), 200),
    FlSpot(hourAgo(0), 180), // 현재
  ]..sort((a, b) => a.x.compareTo(b.x));
}

class _CaffeineChart extends StatelessWidget {
  const _CaffeineChart();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final List<FlSpot> spots = getSixHourSpots();
    return SizedBox(
      height: context.h(200),
      child: LineChart(
        LineChartData(
          minX: now
              .subtract(const Duration(hours: 12))
              .millisecondsSinceEpoch
              .toDouble(),
          maxX: now
              .add(const Duration(minutes: 0))
              .millisecondsSinceEpoch
              .toDouble(),
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
          lineTouchData: const LineTouchData(enabled: false),

          // 그래프 둘러싸는 선
          borderData: FlBorderData(show: false),

          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
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
                    AppColor.primaryColor.withValues(alpha: 0.3),

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
