import 'package:caffeine_stay/common/widgets/page_wrapper.dart';
import 'package:caffeine_stay/features/home/views/home_screen.dart';
import 'package:caffeine_stay/features/menu/views/menu_screen.dart';
import 'package:caffeine_stay/features/menu/views/pages/search/menu_search_screen.dart';
import 'package:caffeine_stay/features/onboard/views/onboard_screen.dart';
import 'package:caffeine_stay/features/onboard/views/pages/myinfo/myinfo_screen.dart';
import 'package:caffeine_stay/features/report/views/report_screen.dart';
import 'package:caffeine_stay/features/settings/views/pages/info/settings_info_screen.dart';
import 'package:caffeine_stay/features/settings/views/pages/notify/settings_notify_screen.dart';
import 'package:caffeine_stay/features/settings/views/settings_screen.dart';
import 'package:caffeine_stay/features/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> featureNavigator = GlobalKey(
  debugLabel: 'feature',
);

final routeProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: SplashScreen.routePath,
    routes: [
      // Splash
      GoRoute(
        path: SplashScreen.routePath,
        name: SplashScreen.routeName,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

      // 온보딩
      GoRoute(
        path: OnboardScreen.routePath,
        name: OnboardScreen.routeName,
        builder: (context, state) {
          return const OnboardScreen();
        },
        routes: [
          GoRoute(
            path: MyinfoScreen.routePath,
            name: MyinfoScreen.routeName,
            builder: (context, state) {
              return const MyinfoScreen();
            },
          ),
        ],
      ),
      // 바텀 nav가 포함된 각 메인 페이지
      _featureRoutes(),
      GoRoute(
        path: MenuSearchScreen.routePath,
        name: MenuSearchScreen.routeName,
        builder: (context, state) {
          final value = state.pathParameters['value'] ?? '';
          return MenuSearchScreen(
            searchText: value,
          );
        },
      ),
      // 설정 -> 개인 정보
      GoRoute(
        path: SettingsInfoScreen.routePath,
        name: SettingsInfoScreen.routeName,
        builder: (context, state) {
          return const SettingsInfoScreen();
        },
      ),
      // 설정 -> 알림
      GoRoute(
        path: SettingsNotifyScreen.routePath,
        name: SettingsNotifyScreen.routeName,
        builder: (context, state) {
          return const SettingsNotifyScreen();
        },
      ),
    ],
  );
});

ShellRoute _featureRoutes() {
  return ShellRoute(
    navigatorKey: featureNavigator,
    builder: (context, state, child) {
      return PageWrapper(child: child);
    },
    routes: [
      GoRoute(
        path: HomeScreen.routePath,
        name: HomeScreen.routeName,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: MenuScreen.routePath,
        name: MenuScreen.routeName,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MenuScreen(),
          );
        },
      ),
      GoRoute(
        path: ReportScreen.routePath,
        name: ReportScreen.routeName,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: ReportScreen(),
          );
        },
      ),
      GoRoute(
        path: SettingsScreen.routePath,
        name: SettingsScreen.routeName,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: SettingsScreen(),
          );
        },
      ),
    ],
  );
}
