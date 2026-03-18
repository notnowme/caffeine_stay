part of 'settings_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.list,
    required this.version,
  });

  final Widget appBar;
  final Widget list;
  final Widget version;

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
          version,
          SliverPadding(
            padding: context.edgeInsets(
              bottom: context.h(120),
            ),
          ),
        ],
      ),
    );
  }
}
