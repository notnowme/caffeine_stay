part of '../menu_search_screen.dart';

class _ResultList extends ConsumerStatefulWidget {
  const _ResultList();

  @override
  ConsumerState<_ResultList> createState() => _ResultListState();
}

class _ResultListState extends ConsumerState<_ResultList> {
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final name = ref.read(menuSearchTextProvider);
      ref.read(menuAsyncProvider.notifier).searchItems(name);
    });
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(menuSearchTextProvider, (prev, next) {
      if (prev == next) return;
      _debouncer.run(() {
        if (mounted && next.trim().isNotEmpty) {
          ref.read(menuAsyncProvider.notifier).searchItems(next);
        }
      });
    });
    return SliverPadding(
      padding: context.edgeInsets(
        top: context.h(16),
        horizontal: context.w(16),
      ),
      sliver: ref
          .watch(menuAsyncProvider)
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
            error: (error, stack) {
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
