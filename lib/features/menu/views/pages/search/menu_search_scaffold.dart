part of 'menu_search_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.resultList,
  });

  final Widget appBar;
  final Widget resultList;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: CustomScrollView(
        slivers: [
          SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: appBar,
              ),
            ],
          ),
          resultList,
          SliverToBoxAdapter(
            child: context.verticalSpace(40),
          ),
        ],
      ),
    );
  }
}
