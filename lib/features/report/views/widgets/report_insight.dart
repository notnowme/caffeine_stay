part of '../report_screen.dart';

class _ReportInsight extends ConsumerWidget {
  const _ReportInsight();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.edgeInsets(
          top: context.h(8),
          horizontal: context.w(16),
        ),
        child: const Stack(
          children: [
            _HeatmapChart(),
            // Positioned.fill(
            //   child: GlassMorphismContainer(
            //     blurIntensity: 1.0,
            //     opacity: 0.15,
            //     glassThickness: 3.5,
            //     tintColor: Colors.blue,
            //     enableBackgroundDistortion: true,
            //     enableGlassBorder: true,
            //     borderRadius: const BorderRadius.all(
            //       Radius.zero,
            //     ),
            //     child: Container(),
            //   ),
            // ),
            // Positioned.fill(
            //   child: Center(
            //     child: Text(
            //       '광고 시청 후 확인해 보세요',
            //       style: PretendardText.body4.copyWith(
            //         color: AppColor.primaryColor,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
