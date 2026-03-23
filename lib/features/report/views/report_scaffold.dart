part of 'report_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.tabHeader,
    required this.tabList,
    required this.heatmapHeader,
    required this.heatmap,
    required this.insightHeader,
    required this.insightList,
  });

  final Widget appBar;
  final Widget tabHeader;
  final Widget tabList;
  final Widget heatmapHeader;
  final Widget heatmap;
  final Widget insightHeader;
  final Widget insightList;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      // backgroundColor: Colors.red,
      child: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          clipBehavior: Clip.none,
          slivers: [
            SliverMainAxisGroup(
              slivers: [
                appBar,
                tabHeader,
                tabList,
                heatmapHeader,
                heatmap,
                insightHeader,
              ],
            ),
            insightList,
            SliverToBoxAdapter(
              child: context.verticalSpace(120),
            ),
          ],
        ),
      ),
    );
  }
}
