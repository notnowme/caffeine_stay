part of '../myinfo_screen.dart';

class _SelectButton extends StatelessWidget {
  const _SelectButton({
    required this.label,
    required this.selected,
    required this.action,
  });

  final String label;
  final bool selected;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TouchRipple(
        rippleColor: AppColor.secondaryColor.withValues(alpha: 0.2),
        rippleBorderRadius: BorderRadius.all(
          Radius.circular(
            context.r(24),
          ),
        ),
        onTap: action,
        child: Container(
          padding: context.edgeInsets(vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: selected
                  ? Colors.transparent
                  : AppColor.primaryColor.withAlpha(50),
            ),
            color: selected ? AppColor.primaryColor : Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                context.r(24),
              ),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: PretendardText.title3.copyWith(
                color: selected
                    ? AppColor.backgroundColor
                    : AppColor.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
