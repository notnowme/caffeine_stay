import 'package:caffeine_stay/features/report/view_models/tab_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class ReportState {
  int watchReportTabState(WidgetRef ref) => ref.watch(reportTabStateProvider);
}

mixin class ReportEvent {
  void tabChange(int tabIndex, WidgetRef ref) =>
      ref.read(reportTabStateProvider.notifier).change(tabIndex);
}
