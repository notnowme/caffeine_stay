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
              if (data.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: context.edgeInsets(
                      top: context.h(16),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.drop_fill,
                            color: AppColor.primaryColor,
                            size: context.h(36),
                          ),
                          context.verticalSpace(4),
                          Text(
                            '아직 카페인 섭취를 기록하지 않았어요.',
                            style: PretendardText.body1.copyWith(
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
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
