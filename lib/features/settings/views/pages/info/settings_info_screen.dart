import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/widgets/bounce_button.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/default_sliver_appbar.dart';
import 'package:caffeine_stay/features/onboard/mixins/myinfo_mixin.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_touch_ripple/widgets/touch_ripple.dart';
import 'package:go_router/go_router.dart';

part 'settings_info_scaffold.dart';
part 'widgets/settings_info_list.dart';
part 'widgets/settings_info_section.dart';
part 'widgets/settings_info_section_item.dart';
part 'widgets/settings_info_section_toggle.dart';
part 'widgets/settings_info_tip.dart';
part 'widgets/settings_info_bottom_sheet.dart';
part 'widgets/settings_info_text_field.dart';

class SettingsInfoScreen extends StatelessWidget {
  const SettingsInfoScreen({super.key});

  static const routePath = '/settingsinfo';
  static const routeName = 'settingsInfo';

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appBar: DefaultSliverAppbar(title: '개인 정보'),
      list: _List(),
      tips: _Tips(),
    );
  }
}
