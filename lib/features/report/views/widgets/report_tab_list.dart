part of '../report_screen.dart';

class _TabList extends ConsumerStatefulWidget {
  const _TabList();

  @override
  ConsumerState<_TabList> createState() => __TabListState();
}

class __TabListState extends ConsumerState<_TabList> with ReportState {
  // 이전 탭 확인
  int _prevIndex = 0;
  @override
  Widget build(BuildContext context) {
    final currentTabState = watchReportTabState(ref);
    final isRightToLeft = currentTabState >= _prevIndex;

    // 프레임이 그려진 후 이전 탭 저장
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prevIndex = currentTabState;
    });

    return SliverToBoxAdapter(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: const Cubic(0.64, 0.34, 0.46, 0.82),
        switchOutCurve: const Cubic(0.64, 0.34, 0.46, 0.82),
        transitionBuilder: (child, animation) {
          // child.key 값과 비교하여 들어오는 것인지 판단
          // Key 만으로는 값에 접근할 수 없으므로 as로 타입 명시
          final isEntering =
              (child.key as ValueKey<int>).value == currentTabState;

          final offset = isEntering
              ? (isRightToLeft
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0))
              : (isRightToLeft
                    ? const Offset(-1.0, 0.0)
                    : const Offset(1.0, 0.0));
          return ClipRRect(
            child: SlideTransition(
              position: Tween<Offset>(
                begin: offset,
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: Container(
          key: ValueKey(currentTabState),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _TabItem(),
              _TabGraph(),
            ],
          ),
        ),
      ),
    );
  }
}
