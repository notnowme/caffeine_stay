import 'package:caffeine_stay/common/mixins/page_mixin.dart';
import 'package:caffeine_stay/common/providers/page_provider.dart';
import 'package:caffeine_stay/common/widgets/bottom_nav.dart';
import 'package:caffeine_stay/features/home/views/home_screen.dart';
import 'package:caffeine_stay/features/menu/views/menu_screen.dart';
import 'package:caffeine_stay/features/report/views/report_screen.dart';
import 'package:caffeine_stay/features/settings/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PageWrapper extends ConsumerWidget with PageEvent {
  const PageWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 리스너를 달아서 한 곳에서 바텀 nav 라우팅 관리...
    ref.listen(pageProvider, (prev, next) {
      final routeName = switch (next) {
        0 => HomeScreen.routeName,
        1 => MenuScreen.routeName,
        2 => ReportScreen.routeName,
        3 => SettingsScreen.routeName,
        _ => HomeScreen.routeName,
      };
      context.goNamed(routeName);
    });
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        final currentPage = ref.read(pageProvider);
        if (currentPage != 0) {
          pageMove(ref, 0);
          return;
        }
        // TODO 종료 여부 묻는 다이얼로그
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(child: child),
            const Positioned(
              bottom: 0,
              child: BottomNav(),
            ),
          ],
        ),
      ),
    );
  }
}
