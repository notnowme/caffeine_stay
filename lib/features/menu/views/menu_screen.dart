import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:caffeine_stay/common/db/db.dart';
import 'package:caffeine_stay/common/models/error_model.dart';
import 'package:caffeine_stay/common/providers/error_provider.dart';
import 'package:caffeine_stay/common/widgets/bounce_button.dart';
import 'package:caffeine_stay/common/widgets/default_scaffold.dart';
import 'package:caffeine_stay/common/widgets/default_sliver_appbar.dart';
import 'package:caffeine_stay/common/widgets/list_item_card.dart';
import 'package:caffeine_stay/features/menu/repositories/menu_repository.dart';
import 'package:caffeine_stay/features/menu/view_models/menu_view_model.dart';
import 'package:caffeine_stay/features/menu/view_models/text_provider.dart';
import 'package:caffeine_stay/features/menu/views/pages/search/menu_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

part 'menu_scaffold.dart';
part 'widgets/menu_searchBar.dart';
part 'widgets/menu_favorite_list.dart';
part 'widgets/menu_bottom_sheet.dart';
part 'widgets/menu_add_button.dart';
part 'widgets/menu_custom_bottom_sheet.dart';
part 'widgets/menu_add_text_field.dart';
part 'widgets/menu_add_category.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  static const routePath = '/menu';
  static const routeName = 'menu';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Scaffold(
      appBar: const DefaultSliverAppbar(title: '카페인 기록'),
      searchBar: MenuSearchBar(
        onSubmit: (value) {
          context
              .pushNamed(
                MenuSearchScreen.routeName,
                pathParameters: {
                  'value': value,
                },
              )
              .then((_) {
                ref.read(menuSearchTextProvider.notifier).clear();
              });
        },
      ),
      favoriteList: const _FavoriteList(),
      addButton: const _AddButton(),
    );
  }
}
