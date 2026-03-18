part of '../menu_screen.dart';

class _AddButton extends ConsumerWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          context.verticalSpace(32),
          Padding(
            padding: context.edgeInsets(horizontal: context.w(16)),
            child: BounceButton(
              buttonColor: AppColor.primaryColor,
              text: Text(
                '나만의 음료 직접 등록하기',
                style: PretendardText.title4.copyWith(
                  color: AppColor.backgroundColor,
                ),
              ),
              action: () async {
                showModalBottomSheet(
                  useRootNavigator: true,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  enableDrag: true,
                  context: context,
                  builder: (bottomSheetContext) {
                    return const _CustomAddBottomSheet();
                  },
                );
              },
            ),
          ),
          context.verticalSpace(80),
        ],
      ),
    );
  }
}
