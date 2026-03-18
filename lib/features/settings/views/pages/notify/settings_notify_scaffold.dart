part of 'settings_notify_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appBar,
    required this.list,
  });

  final Widget appBar;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: CustomScrollView(
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
          const SliverToBoxAdapter(
            child: TipsContainer(
              text: '방해 금지 모드가 켜져 있는 동안에는 알림이 울리지 않을 수 있습니다.',
            ),
          ),
        ],
      ),
    );
  }
}
