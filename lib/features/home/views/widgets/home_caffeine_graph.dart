part of '../home_screen.dart';

class _CaffeineGraph extends ConsumerWidget {
  const _CaffeineGraph();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: context.edgeInsets(all: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColor.primaryColor.withValues(alpha: 0.1),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(context.r(24)),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, context.h(1)),
                blurRadius: 2,
                color: Colors.black.withValues(alpha: 0.05),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '내 카페인 농도 변화',
                style: PretendardText.title4.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              context.verticalSpace(24),
              const _CaffeineChart(),
              context.verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: generateTimeLabels().map((time) {
                  return Text(
                    DateFormat(
                      'HHa',
                    ).format(time).toLowerCase(),
                    style: PretendardText.caption2.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        // Positioned.fill(
        //   child: ClipRRect(
        //     child: BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //       child: Container(
        //         color: Colors.white.withValues(alpha: 0.5),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

List<DateTime> generateTimeLabels() {
  final now = DateTime.now();
  return List.generate(7, (index) {
    // 0, 2, 4, 6, 8, 10, 12시간 전 계산
    return now.subtract(Duration(hours: (6 - index) * 2));
  });
}
