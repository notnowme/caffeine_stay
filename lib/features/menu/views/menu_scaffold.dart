part of 'menu_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.searchBar,
    required this.favoriteList,
    required this.addButton,
  });

  final Widget appBar;
  final Widget searchBar;
  final Widget favoriteList;
  final Widget addButton;

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
                      searchBar,
                      context.verticalSpace(28),
                      Text(
                        '자주 찾는 음료',
                        style: PretendardText.title1.copyWith(
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
          favoriteList,
          addButton,
          SliverToBoxAdapter(
            child: context.verticalSpace(40),
          ),
        ],
      ),
    );
  }
}
