import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/mixins/page_mixin.dart';
import 'package:caffeine_stay/common/providers/page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

part 'bottom_nav_icon.dart';

class BottomNav extends ConsumerWidget with PageEvent {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: context.edgeInsets(
        top: context.h(8),
        bottom: context.h(20),
        left: context.w(20),
        right: context.w(20),
      ),
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        border: Border.all(
          color: AppColor.primaryColor.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.r(24)),
          topRight: Radius.circular(context.r(24)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavIcon(
            action: () {
              pageMove(ref, 0);
            },
            icon: CupertinoIcons.drop_fill,
            selected: page == 0,
            label: '홈',
          ),
          _BottomNavIcon(
            action: () {
              pageMove(ref, 1);
            },
            icon: CupertinoIcons.add,
            selected: page == 1,
            label: '기록',
          ),
          _BottomNavIcon(
            action: () {
              pageMove(ref, 2);
            },
            icon: CupertinoIcons.chart_bar_fill,
            selected: page == 2,
            label: '통계',
          ),
          _BottomNavIcon(
            action: () {
              pageMove(ref, 3);
            },
            icon: Icons.settings,
            selected: page == 3,
            label: '설정',
          ),
        ],
      ),
    );
  }
}
