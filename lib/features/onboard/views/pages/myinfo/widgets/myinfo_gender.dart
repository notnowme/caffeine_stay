part of '../myinfo_screen.dart';

class _Gender extends ConsumerWidget with MyInfoState, MyInfoEvent {
  const _Gender();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myGender = watchGender(ref);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '성별',
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
                setGender(ref, Gender.male);
              },
              label: '남성',
              selected: myGender == Gender.male,
            ),
            context.horizontalSpace(12),
            _SelectButton(
              action: () {
                setGender(ref, Gender.female);
              },
              label: '여성',
              selected: myGender == Gender.female,
            ),
          ],
        ),
      ],
    );
  }
}
