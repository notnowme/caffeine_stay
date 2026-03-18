part of '../report_screen.dart';

class _TabHeader extends ConsumerStatefulWidget {
  const _TabHeader();

  @override
  ConsumerState<_TabHeader> createState() => _TabHeaderState();
}

class _TabHeaderState extends ConsumerState<_TabHeader>
    with SingleTickerProviderStateMixin, ReportEvent {
  late final TabController _tabController;

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      tabChange(_tabController.index, ref);
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          context.verticalSpace(20),
          TabBar(
            controller: _tabController,
            dividerColor: AppColor.primaryColor.withValues(alpha: 0.1),
            dividerHeight: context.h(1),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColor.primaryColor,
            indicatorWeight: context.h(5),
            indicatorPadding: context.edgeInsets(
              horizontal: context.w(12),
            ),
            labelStyle: PretendardText.title4,
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.descColor,
            tabs: const [
              Tab(
                text: '주간',
              ),
              Tab(
                text: '월간',
              ),
              Tab(
                text: '년간',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
