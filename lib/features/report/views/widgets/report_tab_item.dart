part of '../report_screen.dart';

class _TabItem extends StatelessWidget {
  const _TabItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.edgeInsets(
        top: context.h(20),
        bottom: context.h(12),
        horizontal: context.w(16),
      ),
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
          const _TabItemText(),
        ],
      ),
    );
  }
}

class _TabItemText extends ConsumerWidget {
  const _TabItemText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tapState = ref.watch(reportTabStateProvider);

    final duration = switch (tapState) {
      0 => const Duration(days: 7),
      1 => const Duration(days: 30),
      _ => const Duration(days: 7),
    };
    final date = switch (tapState) {
      0 => '주',
      1 => '달',
      _ => '주',
    };
    return ref
        .watch(reportFamilyAsyncProvider(duration))
        .when(
          skipLoadingOnReload: true,
          skipLoadingOnRefresh: true,
          data: (data) {
            final caffeine = ref
                .read(reportFamilyAsyncProvider(duration).notifier)
                .addCaffeineAmount();
            final rate = ref.watch(caffeineDiffProvider(duration)).value ?? 0.0;
            final isUp = rate.toInt() > 0;
            return Padding(
              padding: context.edgeInsets(all: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '최근 한 $date 총 카페인 섭취',
                    style: PretendardText.body2.copyWith(
                      color: AppColor.backgroundColor,
                    ),
                  ),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 0, end: caffeine),
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
                              style: PretendardText.heading3.copyWith(
                                color: AppColor.backgroundColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Text(
                    isUp ? '${rate.toStringAsFixed(1)}% 증가' : '$rate 감소',
                    style: PretendardText.body2.copyWith(
                      color: isUp ? AppColor.errorColor : AppColor.successColor,
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) {
            return Container();
          },
          loading: () {
            return Padding(
              padding: context.edgeInsets(all: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '최근 한 $date 총 카페인 섭취',
                    style: PretendardText.body2.copyWith(
                      color: AppColor.backgroundColor,
                    ),
                  ),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 0, end: 0),
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
                              style: PretendardText.heading3.copyWith(
                                color: AppColor.backgroundColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Text(
                    '0% 감소',
                    style: PretendardText.body2.copyWith(
                      color: AppColor.successColor,
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
