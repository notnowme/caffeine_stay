part of '../report_screen.dart';

List<String> getRecentWeekdays() {
  const weekdayLabels = ['월', '화', '수', '목', '금', '토', '일'];
  final now = DateTime.now();

  return List.generate(7, (i) {
    final date = now.subtract(Duration(days: 6 - i));
    return weekdayLabels[date.weekday - 1];
  });
}

class _HeatmapChart extends ConsumerStatefulWidget {
  const _HeatmapChart();

  @override
  ConsumerState<_HeatmapChart> createState() => _HeatmapChartState();
}

class _HeatmapChartState extends ConsumerState<_HeatmapChart> {
  int? _selectedIndex;
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();
  void hideTooltip() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void showToolTip(
    BuildContext context, {
    required String amount,
    required String time,
  }) {
    hideTooltip();

    overlayEntry = OverlayEntry(
      canSizeOverlay: true,
      builder: (context) {
        return Positioned(
          width: context.w(80),
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: const Offset(-45, -45),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: context.edgeInsets(
                  vertical: context.h(4),
                  horizontal: context.w(4),
                ),
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  border: Border.all(
                    width: 2.0,
                    color: AppColor.primaryColor.withValues(alpha: 0.2),
                  ),
                  borderRadius: BorderRadius.circular(context.r(8)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: PretendardText.caption3.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Text(
                      '$amount mg',
                      style: PretendardText.caption1.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry!);
    // Future.delayed(const Duration(seconds: 1), hideTooltip);
  }

  @override
  Widget build(BuildContext context) {
    final heatmap = ref.watch(heatMapDataProvider).value ?? {};
    final timeList = List.generate(13, (i) {
      return i * 2;
    });

    return Column(
      children: [
        Padding(
          padding: context.edgeInsets(
            left: context.w(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: timeList
                .map(
                  (hour) => Text(
                    '$hour',
                    style: PretendardText.caption1.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        context.verticalSpace(4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: getRecentWeekdays()
                  .map(
                    (day) => Container(
                      clipBehavior: Clip.none,
                      height: context.h(15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        day,
                        style: PretendardText.caption1.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            context.horizontalSpace(8),
            Expanded(
              child: GridView.builder(
                padding: context.edgeInsets(
                  top: context.h(6),
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 24, // 24시간
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemCount: 24 * 7, // 일주일
                itemBuilder: (girdContext, index) {
                  final cellData = heatmap[index] ?? [];
                  String timeText = '';
                  int total = 0;
                  if (cellData.isNotEmpty) {
                    total = cellData
                        .fold(0.0, (prev, e) => prev + e.menu.caffeineAmount)
                        .toInt();

                    final firstTime = cellData.first.report.drinkDateAt;
                    timeText = DateFormat(
                      'HH:mm',
                    ).format(firstTime);
                  }
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onLongPressDown: (details) {
                      if (timeText == '') return;
                      setState(() {
                        _selectedIndex = index;
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showToolTip(
                          context,
                          time: timeText,
                          amount: total.toString(),
                        );
                      });
                    },
                    onLongPressCancel: () {
                      setState(() {
                        _selectedIndex = null;
                      });
                      hideTooltip();
                    },
                    onLongPress: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      showToolTip(
                        context,
                        time: timeText,
                        amount: total.toString(),
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {});
                    },
                    onLongPressEnd: (details) {
                      setState(() {
                        _selectedIndex = null;
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        hideTooltip();
                      });
                    },
                    child: CompositedTransformTarget(
                      link: _selectedIndex == index ? layerLink : LayerLink(),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor.withValues(
                            alpha: (total / 150).clamp(0.03, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(
                            context.r(2),
                          ),
                        ),
                        child: Container(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
