part of 'bottom_nav.dart';

class _BottomNavIcon extends StatelessWidget {
  const _BottomNavIcon({
    required this.label,
    required this.icon,
    required this.action,
    required this.selected,
  });

  final String label;
  final IconData icon;
  final VoidCallback action;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w(48),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: action,
        child: Column(
          children: [
            Icon(
              icon,
              size: context.h(24),
              color: selected
                  ? AppColor.primaryColor
                  : AppColor.primaryColor.withValues(alpha: 0.4),
            ),
            Text(
              label,
              style: PretendardText.caption1.copyWith(
                color: selected
                    ? AppColor.primaryColor
                    : AppColor.primaryColor.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
