part of '../onboard_screen.dart';

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '나에게 딱 맞는 카페인 관리를 위해\n몇 가지 정보를 알려주세요',
          style: PretendardText.heading6.copyWith(
            color: AppColor.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        context.verticalSpace(24),
        Text(
          '체질에 최적화된 카페인 관리를 제공합니다',
          style: PretendardText.body1.copyWith(
            color: AppColor.descColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
