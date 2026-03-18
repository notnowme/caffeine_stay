import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class DefaultSliverAppbar extends StatelessWidget {
  const DefaultSliverAppbar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showBottomBorder = true,
    this.actions,
  });

  final String title;
  final bool showBackButton;
  final bool showBottomBorder;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: Border(
        bottom: BorderSide(
          color: showBottomBorder ? AppColor.descColor : Colors.transparent,
        ),
      ),
      backgroundColor: AppColor.secondaryColor,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: context.h(72),
      elevation: 0,
      leadingWidth: context.w(48),
      floating: true,
      leading: showBackButton
          ? IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: context.h(24),
              ),
            )
          : Container(),
      centerTitle: true,
      title: Text(
        title,
        style: PretendardText.title1.copyWith(
          color: AppColor.primaryColor,
        ),
      ),
      actions: actions,
    );
  }
}
