import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/mixins/api.dart';
import 'package:caffeine_stay/common/providers/secure_storage_provider.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/features/home/views/home_screen.dart';
import 'package:caffeine_stay/features/onboard/views/onboard_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'splash_scaffold.dart';
part 'widgets/splash_text.dart';
part 'widgets/splash_loading.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash';
  static const routePath = '/splash';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with ApiMixin {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  String currentState = '데이터를 확인 중...';

  void _redirect() async {
    final storage = ref.read(secureStorageProvider);
    final currentVersion = await storage.read(key: 'version');
    if (currentVersion == null) {
      final sheetVersion = await getVersion();
      if (sheetVersion != null) {
        await storage.write(key: 'version', value: sheetVersion);
      }
    } else {
      setState(() {
        currentState = '데이터를 읽어 오는 중...';
      });
      await dataCheck(ref);
      if (mounted) {
        setState(() {
          currentState = '데이터 저장 완료!';
        });
        await Future.delayed(const Duration(milliseconds: 200));
        final isFirstTime = await storage.read(key: 'isFirstTime');
        if (mounted) {
          if (isFirstTime == null || isFirstTime == 'true') {
            context.goNamed(OnboardScreen.routeName);
          } else {
            context.goNamed(HomeScreen.routeName);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      text: const _Text(),
      loading: _Loading(
        state: currentState,
      ),
    );
  }
}
