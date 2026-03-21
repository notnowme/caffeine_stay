import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/mixins/api.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/features/home/views/home_screen.dart';
import 'package:caffeine_stay/features/onboard/views/onboard_screen.dart';
import 'package:caffeine_stay/features/splash/providers/splash_redirect_provider.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final splashProvider = ref.watch(splashRedirectProvider);
    ref.listen(splashRedirectProvider, (prev, next) {
      next.whenData((status) {
        if (status == 'onboard') {
          context.goNamed(OnboardScreen.routeName);
        } else if (status == 'home') {
          context.goNamed(HomeScreen.routeName);
        }
      });
    });
    return splashProvider.when(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (data) {
        return _Scaffold(
          text: const _Text(),
          loading: _Loading(
            state: data,
          ),
        );
      },
      loading: () {
        return Container();
      },
      error: (error, stackTrace) {
        return Container();
      },
    );
  }
}
