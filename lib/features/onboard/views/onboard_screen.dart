import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/widgets/bounce_button.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/features/onboard/views/pages/myinfo/myinfo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'onboard_scaffold.dart';
part 'widgets/onboard_icon.dart';
part 'widgets/onboard_text.dart';
part 'widgets/onboard_button.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  static const routePath = '/onboard';
  static const routeName = 'onboard';

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      icon: _Icon(),
      text: _Text(),
      button: _Button(),
    );
  }
}
