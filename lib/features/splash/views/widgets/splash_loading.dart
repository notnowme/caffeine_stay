part of '../splash_screen.dart';

class _Loading extends ConsumerWidget {
  const _Loading({
    required this.state,
  });

  final String state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.edgeInsets(horizontal: 32),
      child: Column(
        children: [
          _ProgressText(
            state: state,
          ),
          context.verticalSpace(16),
          Container(
            height: context.h(2),
            color: AppColor.primaryColor,
          ),
          context.verticalSpace(32),
          Text(
            'B R E W I N G    Y O U R    E X P E R I E N C E',
            style: PretendardText.body9.copyWith(
              color: AppColor.descColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressText extends StatelessWidget {
  const _ProgressText({
    required this.state,
  });

  final String state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          state,
          style: PretendardText.body4.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
