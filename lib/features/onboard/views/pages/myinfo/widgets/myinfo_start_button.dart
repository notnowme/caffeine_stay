part of '../myinfo_screen.dart';

class _Button extends ConsumerWidget with MyInfoEvent {
  const _Button();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.edgeInsets(horizontal: 16),
      child: BounceButton(
        action: () async {
          try {
            await read(ref);
            if (context.mounted) {
              context.goNamed(HomeScreen.routeName);
            }
          } catch (e) {
            //
          }
        },
        buttonColor: AppColor.primaryColor,
        text: Text(
          '시작하기',
          style: PretendardText.title4.copyWith(
            color: AppColor.backgroundColor,
          ),
        ),
      ),
    );
  }
}
