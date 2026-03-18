part of '../splash_screen.dart';

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const _Icon(),
        context.verticalSpace(30),
        Text(
          'Caffeine Stay',
          style: PretendardText.heading1.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        context.verticalSpace(8),
        Text(
          '카페인을 관리해 보세요',
          style: PretendardText.body1.copyWith(
            color: AppColor.descColor,
          ),
        ),
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(128),
      height: context.h(128),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.r(24)),
        color: AppColor.primaryColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withValues(alpha: 0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
    );
  }
}
