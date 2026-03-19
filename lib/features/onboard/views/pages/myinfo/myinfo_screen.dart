import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/providers/secure_storage_provider.dart';
import 'package:caffeine_stay/common/widgets/bounce_button.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/default_sliver_appbar.dart';
import 'package:caffeine_stay/features/home/views/home_screen.dart';
import 'package:caffeine_stay/features/onboard/mixins/myinfo_mixin.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_touch_ripple/widgets/touch_ripple.dart';
import 'package:go_router/go_router.dart';

part 'myinfo_scaffold.dart';
part 'widgets/myinfo_gender.dart';
part 'widgets/myinfo_select_button.dart';
part 'widgets/myinfo_weight.dart';
part 'widgets/myinfo_textField.dart';
part 'widgets/myinfo_age.dart';
part 'widgets/myinfo_smoking.dart';
part 'widgets/myinfo_start_button.dart';

class MyinfoScreen extends StatelessWidget {
  const MyinfoScreen({super.key});

  static const routePath = '/myinfo';
  static const routeName = 'myinfo';

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appBar: DefaultSliverAppbar(
        title: '개인 정보 입력',
      ),
      gender: _Gender(),
      weight: _Weight(),
      age: _Age(),
      smoking: _Smoking(),
      button: _Button(),
    );
  }
}
