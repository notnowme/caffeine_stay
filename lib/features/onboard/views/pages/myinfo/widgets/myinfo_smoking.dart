part of '../myinfo_screen.dart';

class _Smoking extends ConsumerWidget with MyInfoState, MyInfoEvent {
  const _Smoking();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmoking = watchSmoking(ref);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '흡연 여부',
          style: PretendardText.title3.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        context.verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _SelectButton(
              action: () {
                setSmoking(ref, true);
              },
              label: '흡연',
              selected: isSmoking == true,
            ),
            context.horizontalSpace(12),
            _SelectButton(
              action: () {
                setSmoking(ref, false);
              },
              label: '비흡연',
              selected: isSmoking == false,
            ),
          ],
        ),
        context.verticalSpace(12),
        Text(
          '* 흡연은 카페인 대사 속도에 영향을 줄 수 있습니다.',
          style: PretendardText.caption1.copyWith(
            color: AppColor.descColor,
          ),
        ),
      ],
    );
  }
}
