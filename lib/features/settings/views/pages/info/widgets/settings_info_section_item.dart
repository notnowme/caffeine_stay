part of '../settings_info_screen.dart';

class _SectionItem extends StatelessWidget {
  const _SectionItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.amount,
    required this.unit,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final num amount;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return BounceTapper(
      onTap: onTap,
      child: Container(
        padding: context.edgeInsets(
          horizontal: context.w(16),
          vertical: context.h(16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: AppColor.primaryColor.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.r(16),
            ),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, context.h(1)),
              blurRadius: 4,
              color: AppColor.primaryColor.withValues(alpha: 0.05),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: context.edgeInsets(
                    all: context.r(6),
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withValues(
                      alpha: 0.2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        context.r(12),
                      ),
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: context.w(24),
                    color: AppColor.primaryColor,
                  ),
                ),
                context.horizontalSpace(12),
                Text(
                  label,
                  style: PretendardText.title4.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$amount',
                    style: PretendardText.heading5.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ' $unit',
                    style: PretendardText.title6.copyWith(
                      color: AppColor.descColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
