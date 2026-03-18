import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/default_sliver_appbar.dart';
import 'package:caffeine_stay/features/report/mixins/report_graph_mixin.dart';
import 'package:caffeine_stay/features/report/mixins/report_mixin.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

part 'report_scaffold.dart';
part 'widgets/report_tab_header.dart';
part 'widgets/report_tab_list.dart';
part 'widgets/report_tab_item.dart';
part 'widgets/report_tab_graph.dart';
part 'widgets/report_insight_header.dart';
part 'widgets/report_insight.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  static const routePath = '/report';
  static const routeName = 'report';

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appBar: DefaultSliverAppbar(
        title: '카페인 섭취 리포트',
      ),
      tabHeader: _TabHeader(),
      tabList: _TabList(),
      insightHeader: _InsightHeader(),
      insight: _ReportInsight(),
    );
  }
}
