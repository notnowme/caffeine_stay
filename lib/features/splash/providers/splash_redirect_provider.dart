import 'package:caffeine_stay/common/mixins/api.dart';
import 'package:caffeine_stay/common/providers/secure_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Stream<String> redirectStream(Ref ref) async* {
  final storage = ref.read(secureStorageProvider);
  final currentVersion = await storage.read(key: 'version');
  yield '버전 정보를 확인하는 중...';

  final api = ApiMixin();
  if (currentVersion == null) {
    final sheetVersion = await api.getVersion();
    if (sheetVersion != null) {
      await storage.write(key: 'version', value: sheetVersion);
    }
  }

  yield '데이터를 읽어오는 중...';
  await api.dataCheck(ref);

  yield '데이터 저장 완료!';
  await Future.delayed(const Duration(milliseconds: 200));

  yield '개인 정보를 불러오는 중...';
  await Future.delayed(const Duration(milliseconds: 200));

  final isFirstTime = await storage.read(key: 'isFirstTime');

  if (isFirstTime == null || isFirstTime == 'true') {
    yield 'onboard';
  } else {
    yield 'home';
  }
}

final splashRedirectProvider = StreamProvider.autoDispose((ref) {
  return redirectStream(ref);
});
