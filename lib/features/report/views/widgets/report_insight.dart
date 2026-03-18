part of '../report_screen.dart';

class _ReportInsight extends StatelessWidget {
  const _ReportInsight();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: context.edgeInsets(
        horizontal: context.w(16),
      ),
      sliver: SliverList.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return context.verticalSpace(20);
        },
        itemBuilder: (context, index) {
          return const Text('afdsasfdad');
        },
      ),
    );
  }
}
