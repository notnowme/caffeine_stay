import 'dart:math' as math;
import 'dart:ui';

import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/default_sliver_appbar.dart';
import 'package:caffeine_stay/common/widgets/list_item_card.dart';
import 'package:caffeine_stay/features/home/providers/caffeine_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

part 'home_scaffold.dart';
part 'widgets/home_caffein_now.dart';
part 'widgets/home_caffeine_spend.dart';
part 'widgets/home_caffeine_graph.dart';
part 'widgets/home_caffeine_chart.dart';
part 'widgets/home_caffeine_today.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routePath = '/home';
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(
      appBar: DefaultSliverAppbar(
        title: '카페인 스테이',
      ),
      caffeineNow: _CaffineNow(),
      caffeineSpend: _CaffeineSpend(),
      caffeineGraph: _CaffeineGraph(),
      todayDrink: _TodayDrink(),
    );
  }
}
