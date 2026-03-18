part of '../myinfo_screen.dart';

class _Weight extends ConsumerWidget with MyInfoState, MyInfoEvent {
  const _Weight();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myWeight = watchWeight(ref);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '몸무게 (kg)',
          style: PretendardText.title3.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        context.verticalSpace(8),
        _InfoTextField(
          nums: myWeight.toString(),
          onChanged: (value) {
            final weight = double.tryParse(value);
            if (weight == null) return;
            setWeight(ref, weight);
          },
        ),
      ],
    );
  }
}
