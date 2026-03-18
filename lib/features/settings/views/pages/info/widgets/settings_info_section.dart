part of '../settings_info_screen.dart';

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.list,
  });

  final String title;
  final List<Widget> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.edgeInsets(
        horizontal: context.w(8),
        vertical: context.h(24),
      ),
      // decoration: const BoxDecoration(
      //   color: Colors.white,
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: PretendardText.title4.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
          context.verticalSpace(12),
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            separatorBuilder: (context, index) {
              return context.verticalSpace(16);
            },
            itemBuilder: (context, index) {
              return list[index];
            },
          ),
        ],
      ),
    );
  }
}
