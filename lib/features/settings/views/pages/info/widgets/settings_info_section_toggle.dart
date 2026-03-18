part of '../settings_info_screen.dart';

class _SectionToggleItem extends StatelessWidget {
  const _SectionToggleItem({
    required this.icon,
    required this.label,
    required this.ontapFirst,
    required this.ontapSecond,
    required this.selectedIndex,
    required this.option1,
    required this.option2,
  });

  final IconData icon;
  final String label;
  final VoidCallback ontapFirst;
  final VoidCallback ontapSecond;
  final int selectedIndex;
  final String option1;
  final String option2;

  @override
  Widget build(BuildContext context) {
    final firstSelected = 0 == selectedIndex;
    return Container(
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
            offset: Offset(0, context.h(2)),
            blurRadius: 4,
            color: AppColor.primaryColor.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Column(
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
          context.verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: TouchRipple(
                  rippleColor: AppColor.secondaryColor.withValues(alpha: 0.2),
                  rippleBorderRadius: BorderRadius.all(
                    Radius.circular(
                      context.r(6),
                    ),
                  ),
                  onTap: ontapFirst,
                  child: Container(
                    padding: context.edgeInsets(
                      vertical: context.h(10),
                    ),
                    decoration: BoxDecoration(
                      color: firstSelected
                          ? AppColor.primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(context.r(6)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      option1,
                      style: PretendardText.title1.copyWith(
                        color: firstSelected
                            ? Colors.white
                            : AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              // context.horizontalSpace(4),
              Expanded(
                child: TouchRipple(
                  rippleColor: AppColor.secondaryColor.withValues(alpha: 0.2),
                  rippleBorderRadius: BorderRadius.all(
                    Radius.circular(
                      context.r(6),
                    ),
                  ),
                  onTap: ontapSecond,
                  child: Container(
                    padding: context.edgeInsets(
                      vertical: context.h(10),
                    ),
                    decoration: BoxDecoration(
                      color: !firstSelected
                          ? AppColor.primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(context.r(6)),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      option2,
                      style: PretendardText.title1.copyWith(
                        color: !firstSelected
                            ? Colors.white
                            : AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
