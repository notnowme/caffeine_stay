part of '../onboard_screen.dart';

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.edgeInsets(
        horizontal: context.w(32),
      ),
      child: BounceButton(
        action: () {
          context.pushNamed(MyinfoScreen.routeName);
        },
        buttonColor: AppColor.primaryColor,
        text: Text(
          '알려주기',
          style: PretendardText.title4.copyWith(
            color: AppColor.backgroundColor,
          ),
        ),
      ),
    );
  }
}
