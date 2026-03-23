part of '../menu_screen.dart';

class MenuBottomSheet extends ConsumerWidget {
  const MenuBottomSheet({
    super.key,
    required this.item,
    required this.child,
  });

  final Widget child;
  final CaffeineItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BounceTapper(
      onTap: () {
        showModalBottomSheet(
          useRootNavigator: true,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          enableDrag: true,
          context: context,
          builder: (bottomSheetContext) {
            return Padding(
              padding: context.edgeInsets(
                horizontal: context.w(16),
                bottom: context.h(30),
              ),
              child: Container(
                padding: context.edgeInsets(horizontal: context.w(24)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(context.r(16)),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, context.h(20)),
                      blurRadius: 25,
                      spreadRadius: -3,
                      color: AppColor.primaryColor.withValues(alpha: 0.1),
                    ),
                    BoxShadow(
                      offset: Offset(0, context.h(8)),
                      blurRadius: 10,
                      spreadRadius: -6,
                      color: AppColor.primaryColor.withValues(alpha: 0.1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    context.verticalSpace(12),
                    Center(
                      child: Container(
                        width: context.w(48),
                        height: context.h(4),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor.withValues(
                            alpha: 0.2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(context.r(6)),
                          ),
                        ),
                      ),
                    ),
                    context.verticalSpace(12),

                    Text(
                      item.name,
                      style: PretendardText.title1.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    // context.verticalSpace(6),
                    Row(
                      children: [
                        Text(
                          item.serviceSize,
                          style: PretendardText.caption1.copyWith(
                            color: AppColor.primaryColor.withValues(
                              alpha: 0.8,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.bolt_outlined,
                          size: context.h(16),
                          color: AppColor.primaryColor,
                        ),

                        Text(
                          '${item.caffeineAmount}mg',
                          style: PretendardText.caption1.copyWith(
                            color: AppColor.primaryColor.withValues(
                              alpha: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                    context.verticalSpace(30),
                    BounceButton(
                      buttonColor: AppColor.primaryColor,
                      text: Text(
                        '기록하기',
                        style: PretendardText.title4.copyWith(
                          color: AppColor.backgroundColor,
                        ),
                      ),
                      action: () async {
                        try {
                          await ref
                              .read(menuRepositoryProvider)
                              .addReport(item);
                          await ref
                              .read(favoriteMenuAsyncProvider.notifier)
                              .refresh();
                        } catch (e) {
                          final error = CustomUserError(
                            title: '메뉴',
                            message: '해당되는 메뉴가 없습니다.',
                            path: '',
                          );
                          ref.read(errorProvider.notifier).updateError(error);
                        }
                        if (context.mounted) {
                          context.pop();
                        }
                        if (bottomSheetContext.mounted) {}
                      },
                    ),
                    context.verticalSpace(30),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}
