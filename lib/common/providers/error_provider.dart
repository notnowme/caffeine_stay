import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorNotifier extends Notifier<CustomError?> {
  @override
  CustomError? build() {
    return null;
  }

  void updateError(CustomError error) {
    state = error;
  }

  void clear() {
    state = null;
  }
}

final errorProvider = NotifierProvider(() => ErrorNotifier());
