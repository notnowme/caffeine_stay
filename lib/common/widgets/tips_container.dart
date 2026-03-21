import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class TipsContainer extends StatelessWidget {
  const TipsContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.edgeInsets(
        top: context.h(24),
        horizontal: context.w(16),
      ),
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        border: Border.all(
          width: 2,
          color: AppColor.primaryColor.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            context.r(12),
          ),
        ),
      ),
      padding: context.edgeInsets(
        horizontal: context.w(12),
        vertical: context.h(8),
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.exclamationmark_triangle,
            size: context.h(24),
            color: AppColor.primaryColor,
          ),
          context.horizontalSpace(12),
          Expanded(
            child: Text(
              text,

              style: PretendardText.body6.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
