part of '../home_screen.dart';

class _TodayDrink extends ConsumerWidget {
  const _TodayDrink();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('today page');
    return SliverPadding(
      padding: context.edgeInsets(
        horizontal: context.w(16),
      ),
      sliver: ref
          .watch(todayCaffeineProvider)
          .when(
            data: (data) {
              return SliverList.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) {
                  return context.verticalSpace(16);
                },
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ItemCard(
                    title: item.menu.name,
                    cat: item.menu.brand ?? '',
                    unit: item.menu.serviceSize,
                    caffeine: item.menu.caffeineAmount,
                    date: item.report.drinkDateAt,
                  );
                },
              );
            },
            error: (error, trace) {
              return SliverToBoxAdapter(
                child: Container(),
              );
            },
            loading: () {
              return SliverToBoxAdapter(
                child: Container(),
              );
            },
          ),
    );
  }
}
