part of '../menu_screen.dart';

class _FavoriteList extends ConsumerWidget {
  const _FavoriteList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: context.edgeInsets(
        horizontal: context.w(16),
      ),
      sliver: ref
          .watch(favoriteMenuAsyncProvider)
          .when(
            data: (data) {
              return SliverList.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) {
                  return context.verticalSpace(16);
                },
                itemBuilder: (context, index) {
                  final item = data[index];
                  return MenuBottomSheet(
                    item: item,
                    child: ItemCard(
                      title: item.name,
                      cat: item.brand ?? '',
                      unit: item.serviceSize,
                      caffeine: item.caffeineAmount,
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return SliverToBoxAdapter(
                child: Container(),
              );
            },
            loading: () {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: context.h(600),
                ),
              );
            },
          ),
    );
  }
}
