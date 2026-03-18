import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    this.backgroundColor = AppColor.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    required this.child,
  });

  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 키보드가 보였을 때 밀리거나 안 밀리거나
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      body: child,
    );
  }
}
