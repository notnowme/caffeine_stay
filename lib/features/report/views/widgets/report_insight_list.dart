part of '../report_screen.dart';

class _InsightList extends StatelessWidget {
  const _InsightList();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          children: [
            Icon(
              CupertinoIcons.quote_bubble,
              color: AppColor.primaryColor,
              size: context.h(36),
            ),
            context.verticalSpace(4),
            Text(
              '카페인 인사이트를 찾게 되면 알려드릴게요.',
              style: PretendardText.body1.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
    // return SliverPadding(
    //   padding: context.edgeInsets(
    //     horizontal: context.w(16),
    //   ),
    //   sliver: SliverList.separated(
    //     itemCount: 10,
    //     separatorBuilder: (context, index) {
    //       return context.verticalSpace(20);
    //     },
    //     itemBuilder: (context, index) {
    //       return const Text('afdsasfdad');
    //     },
    //   ),
    // );
  }
}
