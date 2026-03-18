part of '../home_screen.dart';

class _CaffeineSpend extends ConsumerWidget {
  const _CaffeineSpend();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayCaffeine = ref.watch(todayCaffeineAmountProvider).value ?? 0.0;
    return Row(
      children: [
        _CaffeineSpendCard(
          title: '오늘 섭취량',
          caffeineAmount: todayCaffeine,
        ),
        context.horizontalSpace(16),
        _CaffeineSpendCard(
          title: '남은 섭취량',
          caffeineAmount: 400 - todayCaffeine,
        ),
      ],
    );
  }
}

class _CaffeineSpendCard extends StatelessWidget {
  const _CaffeineSpendCard({
    required this.title,
    required this.caffeineAmount,
  });

  final String title;
  final double caffeineAmount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: context.edgeInsets(all: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColor.primaryColor.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(context.r(24)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: PretendardText.title8.copyWith(
                color: AppColor.descColor,
              ),
            ),
            // context.verticalSpace(2),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: caffeineAmount),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: value.toStringAsFixed(0),
                        style: PretendardText.title1.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: ' mg',
                        style: PretendardText.title4.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            context.verticalSpace(8),
            _CaffeineProgress(
              caffeineAmount: caffeineAmount.toInt(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CaffeineProgress extends StatelessWidget {
  const _CaffeineProgress({
    required this.caffeineAmount,
  });

  final int caffeineAmount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.h(10),
          decoration: BoxDecoration(
            color: AppColor.primaryColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.all(
              Radius.circular(context.r(10)),
            ),
          ),
        ),
        AnimatedFractionallySizedBox(
          curve: const Cubic(0.64, 0.34, 0.46, 0.82),
          duration: const Duration(milliseconds: 500),
          widthFactor: (caffeineAmount / 400).clamp(0.0, 1.0),
          child: Container(
            height: context.h(10),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(context.r(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
