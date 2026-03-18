import 'package:caffeine_stay/common/mixins/error_handle.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorBounderyWrapperWidget extends ConsumerWidget with ErrorHandle {
  const ErrorBounderyWrapperWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(errorProvider, (prev, error) {
      if (error != null) {
        showDialog(
          useRootNavigator: true,
          context: rootNavigator.currentContext!,
          builder: (dialogContext) {
            return Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red,
              child: Text(
                error.message,
              ),
            );
          },
        );
        handleError(error, ref);
      }
    });
    return child;
  }
}
