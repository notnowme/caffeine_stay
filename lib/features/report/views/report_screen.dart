import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/default_sliver_appbar.dart';
import 'package:caffeine_stay/features/home/providers/caffeine_provider.dart';
import 'package:caffeine_stay/features/report/mixins/report_graph_mixin.dart';
import 'package:caffeine_stay/features/report/mixins/report_mixin.dart';
import 'package:caffeine_stay/features/report/view_models/report_view_models.dart';
import 'package:caffeine_stay/features/report/view_models/tab_state_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

part 'report_scaffold.dart';
part 'widgets/report_tab_header.dart';
part 'widgets/report_tab_list.dart';
part 'widgets/report_tab_item.dart';
part 'widgets/report_tab_graph.dart';
part 'widgets/report_insight_header.dart';
part 'widgets/report_insight.dart';
part 'widgets/report_heatmap.dart';
part 'widgets/report_insight_list.dart';

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
      heatmapHeader: _InsightHeader(
        title: '카페인 섭취 시간대 분포',
      ),
      heatmap: _ReportInsight(),
      insightHeader: _InsightHeader(
        title: '카페인 인사이트',
      ),
      insightList: _InsightList(),
    );
  }
}
