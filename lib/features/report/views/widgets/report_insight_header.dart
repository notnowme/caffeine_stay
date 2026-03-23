part of '../report_screen.dart';

class _InsightHeader extends StatelessWidget {
  const _InsightHeader({
    required this.title,
  });

  final String title;

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
              title,
              style: PretendardText.title1.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
