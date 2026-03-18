part of '../myinfo_screen.dart';

class _Age extends ConsumerWidget with MyInfoState, MyInfoEvent {
  const _Age();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAge = watchAge(ref);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '나이',
          style: PretendardText.title3.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        context.verticalSpace(8),
        _InfoTextField(
          nums: myAge.toString(),
          onChanged: (value) {
            final age = int.tryParse(value);
            if (age == null) return;
            setAge(ref, age);
          },
        ),
      ],
    );
  }
}
