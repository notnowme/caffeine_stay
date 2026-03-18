import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO 각 에러 상태에 맞게 처리하기
mixin class ErrorHandle {
  void handleError(CustomError error, WidgetRef ref) {
    switch (error) {
      case CustomNetworkError():
        print('a');
      case CustomUserError():
        print('b');
      case CustomOthersError():
        print('c');
      case CustomUserWarningkError():
        print('d');
    }
    ref.read(errorProvider.notifier).clear();
  }
}
