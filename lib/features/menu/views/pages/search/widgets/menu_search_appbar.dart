part of '../menu_search_screen.dart';

class _MenuSearchAppBar extends ConsumerWidget {
  const _MenuSearchAppBar({
    this.searchText = '',
  });

  final String searchText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColor.descColor.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Padding(
        padding: context.edgeInsets(
          horizontal: context.w(16),
          bottom: context.h(12),
        ),
        child: Column(
          children: [
            context.verticalSpace(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: Offset(context.w(-8), 0),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: context.h(24),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '검색 결과',
                  style: PretendardText.title1.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: context.w(48),
                ),
              ],
            ),
            context.verticalSpace(16),
            MenuSearchBar(
              onSubmit: (value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
