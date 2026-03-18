part of '../report_screen.dart';

class _InsightHeader extends StatelessWidget {
  const _InsightHeader();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.edgeInsets(
          horizontal: context.w(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            context.verticalSpace(24),
            Text(
              '카페인 인사이트',
              style: PretendardText.title1.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            context.verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
