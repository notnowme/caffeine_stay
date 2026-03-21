import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/hooks/hooks.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/list_item_card.dart';
import 'package:caffeine_stay/features/menu/view_models/menu_view_model.dart';
import 'package:caffeine_stay/features/menu/view_models/text_provider.dart';
import 'package:caffeine_stay/features/menu/views/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'menu_search_scaffold.dart';
part 'widgets/menu_search_appbar.dart';
part 'widgets/menu_search_result_list.dart';

class MenuSearchScreen extends StatelessWidget {
  const MenuSearchScreen({
    super.key,
    this.searchText = '',
  });

  final String searchText;

  static const routePath = '/search/:value';
  static const routeName = 'search';

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      appBar: _MenuSearchAppBar(
        searchText: searchText,
      ),
      resultList: const _ResultList(),
    );
  }
}
