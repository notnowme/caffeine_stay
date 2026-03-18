part of 'report_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.tabHeader,
    required this.tabList,
    required this.insightHeader,
    required this.insight,
  });

  final Widget appBar;
  final Widget tabHeader;
  final Widget tabList;
  final Widget insightHeader;
  final Widget insight;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      // backgroundColor: Colors.red,
      child: DefaultTabController(
        length: 3,
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            SliverMainAxisGroup(
              slivers: [
                appBar,
                tabHeader,
                tabList,
                insightHeader,
              ],
            ),
            insight,
            SliverToBoxAdapter(
              child: context.verticalSpace(120),
            ),
          ],
        ),
      ),
    );
  }
}
