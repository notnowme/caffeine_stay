part of 'home_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.caffeineNow,
    required this.caffeineSpend,
    required this.caffeineGraph,
    required this.todayDrink,
  });

  final Widget appBar;
  final Widget caffeineNow;
  final Widget caffeineSpend;
  final Widget caffeineGraph;
  final Widget todayDrink;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: CustomScrollView(
        slivers: [
          SliverMainAxisGroup(
            slivers: [
              appBar,
              SliverToBoxAdapter(
                child: Padding(
                  padding: context.edgeInsets(
                    horizontal: context.w(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      context.verticalSpace(16),
                      caffeineNow,
                      context.verticalSpace(16),
                      caffeineSpend,
                      context.verticalSpace(16),
                      caffeineGraph,
                      context.verticalSpace(24),
                      Text(
                        '오늘 마신 카페인 음료',
                        style: PretendardText.title3.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      context.verticalSpace(16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          todayDrink,
          SliverToBoxAdapter(
            child: context.verticalSpace(120),
          ),
        ],
      ),
    );
  }
}
