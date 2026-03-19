import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/default_sliver_appbar.dart';
import 'package:caffeine_stay/common/widgets/tips_container.dart';
import 'package:caffeine_stay/common/widgets/toggle_switch.dart';
import 'package:caffeine_stay/features/settings/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

part 'settings_notify_scaffold.dart';
part 'widgets/settings_notify_list.dart';

class SettingsNotifyScreen extends StatelessWidget {
  const SettingsNotifyScreen({super.key});

  static const routePath = '/notify';
  static const routeName = 'notify';

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appBar: DefaultSliverAppbar(
        title: '알림 설정',
        showBackButton: true,
      ),
      list: _List(),
    );
  }
}
