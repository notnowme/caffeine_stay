part of '../home_screen.dart';

class _CaffineNow extends StatelessWidget {
  const _CaffineNow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(context.r(24)),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, context.h(10)),
            blurRadius: 15,
            spreadRadius: -3,
            color: AppColor.primaryColor.withValues(alpha: 0.2),
          ),
          BoxShadow(
            offset: Offset(0, context.h(4)),
            blurRadius: 6,
            spreadRadius: -4,
            color: AppColor.primaryColor.withValues(alpha: 0.2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: context.r(-40),
            top: context.r(-40),
            child: Container(
              width: context.r(160),
              height: context.r(160),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor.withValues(alpha: 0.05),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.secondaryColor.withValues(
                      alpha: 0.1,
                    ),
                    blurRadius: 64,
                    spreadRadius: 8,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: context.edgeInsets(all: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '현재 카페인 수치',
                  style: PretendardText.body2.copyWith(color: Colors.white),
                ),
                context.verticalSpace(4),
                const _CaffeineRealTimeText(),
                context.verticalSpace(20),
                const _SleepPeriodic(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CaffeineRealTimeText extends ConsumerWidget {
  const _CaffeineRealTimeText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCaffeine =
        ref.watch(currentCaffeineStreamProvider).value ?? 0.0;
    return TweenAnimationBuilder(
      tween: Tween(begin: 0, end: currentCaffeine),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value.toStringAsFixed(0),
                style: PretendardText.headingNumber.copyWith(
                  color: AppColor.backgroundColor,
                ),
              ),
              TextSpan(
                text: ' mg',
                style: PretendardText.title2.copyWith(
                  color: AppColor.backgroundColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SleepPeriodic extends StatelessWidget {
  const _SleepPeriodic();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundColor.withValues(alpha: .2),
        borderRadius: BorderRadius.all(
          Radius.circular(context.r(24)),
        ),
      ),
      child: Padding(
        padding: context.edgeInsets(
          vertical: 6,
          horizontal: 12,
        ),
        child: Row(
          children: [
            Transform.rotate(
              angle: -math.pi / 6,
              child: Icon(
                size: context.r(24),
                Icons.nightlight_outlined,
                color: AppColor.backgroundColor.withValues(alpha: 0.8),
              ),
            ),
            context.horizontalSpace(8),
            Text(
              '예상 수면 가능 시간: ',
              style: PretendardText.body4.copyWith(
                color: AppColor.backgroundColor,
              ),
            ),
            Text(
              '오후 11:30',
              style: PretendardText.body1.copyWith(
                color: AppColor.backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
