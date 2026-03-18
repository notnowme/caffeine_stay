part of '../settings_screen.dart';

class _Version extends StatelessWidget {
  const _Version();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          context.verticalSpace(32),
          Text(
            'Caffeine Stay v1.0.0',
            style: PretendardText.body5.copyWith(
              color: AppColor.descColor,
            ),
          ),
        ],
      ),
    );
  }
}
