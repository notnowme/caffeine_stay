part of '../menu_screen.dart';

class _MenuAddCategory extends StatelessWidget {
  const _MenuAddCategory();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '카테고리',
          style: PretendardText.title6.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        context.verticalSpace(8),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: context.w(12),
          crossAxisSpacing: context.h(16),
          childAspectRatio: 3.0,
          children: const [
            _MenuAddCatCard(
              label: '커피',
              icon: CupertinoIcons.drop_fill,
              isSelected: true,
            ),
            _MenuAddCatCard(
              label: '음료',
              icon: CupertinoIcons.bolt_fill,
              isSelected: false,
            ),
            _MenuAddCatCard(
              label: '차',
              icon: CupertinoIcons.drop,
              isSelected: false,
            ),
            _MenuAddCatCard(
              label: '기타',
              icon: CupertinoIcons.ellipsis,
              isSelected: false,
            ),
          ],
        ),
        context.verticalSpace(30),
      ],
    );
  }
}

class _MenuAddCatCard extends StatelessWidget {
  const _MenuAddCatCard({
    required this.isSelected,
    required this.label,
    required this.icon,
  });

  final bool isSelected;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(context.r(16)),
        ),
        color: isSelected
            ? Colors.white
            : AppColor.descColor.withValues(
                alpha: 0.1,
              ),
        border: Border.all(
          color: isSelected ? AppColor.primaryColor : AppColor.descColor,
          width: isSelected ? 2.5 : 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? AppColor.primaryColor : AppColor.descColor,
          ),
          context.horizontalSpace(4),
          Text(
            label,
            style: PretendardText.title4.copyWith(
              color: isSelected ? AppColor.primaryColor : AppColor.descColor,
            ),
          ),
        ],
      ),
    );
  }
}
