part of '../settings_screen.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: PretendardText.title4.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
          context.verticalSpace(16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
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
