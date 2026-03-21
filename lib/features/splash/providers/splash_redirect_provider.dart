import 'package:caffeine_stay/common/mixins/api.dart';
import 'package:caffeine_stay/common/providers/secure_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Stream<Map<String, String>> redirectStream(Ref ref) async* {
  final storage = ref.read(secureStorageProvider);
  final currentVersion = await storage.read(key: 'version');
  yield {
    'status': 'version',
    'message': '버전 정보를 확인하는 중...',
  };

  final api = ApiMixin();
  if (currentVersion == null) {
    final sheetVersion = await api.getVersion();
    if (sheetVersion != null) {
      await storage.write(key: 'version', value: sheetVersion);
    }
  }

  yield {
    'status': 'data',
    'message': '데이터를 읽어오는 중...',
  };
  await api.dataCheck(ref);

  yield {
    'status': 'data',
    'message': '데이터 저장 완료!',
  };
  await Future.delayed(const Duration(milliseconds: 200));

  yield {
    'status': 'info',
    'message': '개인 정보 확인하는 중...',
  };
  await Future.delayed(const Duration(milliseconds: 200));

  final isFirstTime = await storage.read(key: 'isFirstTime');

  if (isFirstTime == null || isFirstTime == 'true') {
    yield {
      'status': 'move',
      'message': 'onboard',
    };
  } else {
    yield {
      'status': 'move',
      'message': 'home',
    };
  }
}

final splashRedirectProvider = StreamProvider.autoDispose((ref) {
  return redirectStream(ref);
});
