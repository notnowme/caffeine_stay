part of '../onboard_screen.dart';

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentGeometry.center,
      children: [
        SizedBox(
          width: context.w(308),
          height: context.h(308),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [
                  AppColor.primaryColor.withValues(alpha: 0.1),
                  AppColor.primaryColor.withValues(
                    alpha: 0.3,
                  ),
                  Colors.transparent,
                ],
                stops: const [0.6, 0.8, 1.0],
              ),
            ),
          ),
        ),

        SizedBox(
          width: context.w(246),
          height: context.h(246),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryColor.withValues(alpha: 0.2),
            ),
          ),
        ),

        SizedBox(
          width: context.w(192),
          height: context.h(192),
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryColor,
            ),
          ),
        ),
        Icon(
          color: AppColor.secondaryColor,
          size: context.h(85),
          CupertinoIcons.drop_fill,
        ),
      ],
    );
  }
}
