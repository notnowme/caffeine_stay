import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({
    super.key,
    required this.isOn,
    required this.onTap,
  });

  final bool isOn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: !isOn ? AppColor.primaryColor : AppColor.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.r(24),
            ),
          ),
        ),
        child: AnimatedPadding(
          padding: context.edgeInsets(
            left: isOn ? context.w(3) : context.w(23),
            right: !isOn ? context.w(3) : context.w(23),
            vertical: context.h(3),
          ),
          duration: const Duration(milliseconds: 200),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: context.w(24),
              height: context.h(24),
            ),
          ),
        ),
      ),
    );
  }
}
