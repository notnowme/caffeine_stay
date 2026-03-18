import 'package:caffeine_stay/common/widgets/error_wrapper.dart';
import 'package:caffeine_stay/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/date_symbol_data_local.dart';

// riverpod을 글로벌로 접근하기 위해
final globalContainer = ProviderContainer();

void main() async {
  // 플러터 엔진이 준비됐는지
  WidgetsFlutterBinding.ensureInitialized();

  // env 로드
  await dotenv.load(fileName: ".env");

  initializeDateFormatting().then(
    (_) => runApp(
      // ref를 넘겨줄 수 없을 때 사용할 수 있어짐.
      UncontrolledProviderScope(
        container: globalContainer,
        child: const ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return ScreenUtilPlusInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // 문서를 보니 false + context.w / context.h이 성능이 좋다고 함
      autoRebuild: false,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            if (child != null) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                // 모든 에러를 전역적으로 처리하기 위한 Wrapper
                child: ErrorBounderyWrapperWidget(
                  child: child,
                ),
              );
            }
            throw StateError('Widget is Null');
          },
        );
      },
    );
  }
}
