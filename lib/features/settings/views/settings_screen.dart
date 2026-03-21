import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/mixins/api.dart';
import 'package:caffeine_stay/common/providers/notify_provider.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/default_sliver_appbar.dart';
import 'package:caffeine_stay/features/settings/views/pages/info/settings_info_screen.dart';
import 'package:caffeine_stay/features/settings/views/pages/notify/settings_notify_screen.dart';
import 'package:caffeine_stay/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'settings_scaffold.dart';
part 'widgets/settings_list.dart';
part 'widgets/settings_section.dart';
part 'widgets/settings_item.dart';
part 'widgets/settings_version.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routePath = '/settings';
  static const routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appBar: DefaultSliverAppbar(title: '설정'),
      list: _List(),
      version: _Version(),
    );
  }
}
