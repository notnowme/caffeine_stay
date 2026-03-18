part of 'settings_info_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.list,
    required this.tips,
  });

  final Widget appBar;
  final Widget list;
  final Widget tips;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverMainAxisGroup(
            slivers: [
              appBar,
              SliverToBoxAdapter(
                child: context.verticalSpace(24),
              ),
            ],
          ),
          list,
          tips,
          SliverToBoxAdapter(
            child: context.verticalSpace(80),
          ),
        ],
      ),
    );
  }
}
