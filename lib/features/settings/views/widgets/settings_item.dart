part of '../settings_screen.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isWarn = false,
    this.desc,
    this.button,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isWarn;
  final String? desc;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return BounceTapper(
      enable: button == null,
      onTap: onTap,
      highlightColor: AppColor.primaryColor.withValues(alpha: 0.1),
      highlightBorderRadius: BorderRadius.all(Radius.circular(context.r(16))),
      child: Container(
        padding: context.edgeInsets(
          vertical: context.h(16),
          left: context.w(16),
          right: context.w(16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
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
              blurRadius: 2,

              color: AppColor.primaryColor.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: context.edgeInsets(
                      all: context.r(6),
                    ),
                    decoration: BoxDecoration(
                      color: isWarn
                          ? AppColor.errorColor.withValues(alpha: 0.2)
                          : AppColor.primaryColor.withValues(
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
                      color: isWarn
                          ? AppColor.errorColor
                          : AppColor.primaryColor,
                    ),
                  ),
                  context.horizontalSpace(16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: PretendardText.title4.copyWith(
                            color: isWarn
                                ? AppColor.errorColor
                                : AppColor.primaryColor,
                          ),
                        ),
                        if (desc != null) ...[
                          context.verticalSpace(4),
                          Text(
                            desc!,
                            style: PretendardText.body7.copyWith(
                              color: AppColor.descColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (button != null) ...[
              context.horizontalSpace(12),
              button!,
            ],
          ],
        ),
      ),
    );
  }
}
