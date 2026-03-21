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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isOn ? AppColor.primaryColor : AppColor.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.r(24),
            ),
          ),
        ),
        child: AnimatedPadding(
          padding: context.edgeInsets(
            left: !isOn ? context.w(3) : context.w(23),
            right: isOn ? context.w(3) : context.w(23),
            vertical: context.h(3),
          ),
          curve: const Cubic(0.64, 0.34, 0.46, 0.82),
          duration: const Duration(milliseconds: 300),
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
