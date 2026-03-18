import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BounceButton extends StatelessWidget {
  const BounceButton({
    super.key,
    required this.buttonColor,
    required this.text,
    required this.action,
  });

  final Color buttonColor;
  final Text text;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return BounceTapper(
      delayedDurationBeforeGrow: Duration.zero,
      onTap: action,
      highlightColor: AppColor.secondaryColor.withValues(alpha: 0.1),
      child: Container(
        padding: context.edgeInsets(
          vertical: context.h(18),
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.r(16),
            ),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, context.h(10)),
              blurRadius: 15,
              spreadRadius: -3,
              color: AppColor.primaryColor.withValues(alpha: 0.2),
            ),
            BoxShadow(
              offset: Offset(0, context.h(4)),
              blurRadius: 6,
              spreadRadius: -4,
              color: AppColor.primaryColor.withValues(alpha: 0.2),
            ),
          ],
        ),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
