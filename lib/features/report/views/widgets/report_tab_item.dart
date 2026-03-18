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
          Padding(
            padding: context.edgeInsets(all: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '이번 달 총 카페인 섭취',
                  style: PretendardText.body2.copyWith(
                    color: AppColor.backgroundColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '1000',
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
                ),
                Text(
                  '지난 달 대비 12% 감소',
                  style: PretendardText.body2.copyWith(
                    color: AppColor.successColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
