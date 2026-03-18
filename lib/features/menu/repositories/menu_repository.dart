import 'package:caffeine_stay/common/db/db.dart';
import 'package:caffeine_stay/features/menu/models/report_with_menu_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuRepository {
  final AppDataBase _db;
  MenuRepository(this._db);

  Future<void> addReport(CaffeineItem item) async {
    await _db.transaction(() async {
      final updated =
          await (_db.update(
            _db.caffeineItems,
          )..where((t) => t.id.equals(item.id))).write(
            CaffeineItemsCompanion(
              hits: Value(item.hits + 1),
            ),
          );
      if (updated > 0) {
        final companion = ReportsCompanion.insert(itemId: item.id);
        await _db.into(_db.reports).insert(companion);
      } else {
        throw Exception('해당 되는 메뉴가 없습니다.');
      }
    });
  }

  Future<List<ReportWithMenuModel>?> fetchReportByDate(
    Duration duration,
  ) async {
    final query =
        _db.select(_db.reports).join([
            innerJoin(
              _db.caffeineItems,
              _db.caffeineItems.id.equalsExp(
                _db.reports.itemId,
              ),
            ),
          ])
          ..where(
            _db.reports.drinkDateAt.isBiggerOrEqualValue(
              DateTime.now().subtract(
                duration,
              ),
            ),
          )
          ..orderBy(
            [OrderingTerm.desc(_db.reports.drinkDateAt)],
          );
    final results = await query.get();
    return results.map((row) {
      return ReportWithMenuModel(
        report: row.readTable(_db.reports),
        menu: row.readTable(_db.caffeineItems),
      );
    }).toList();
  }

  Future<CaffeineItem?> getMenuItem(String name) async {
    return await (_db.select(_db.caffeineItems)
          ..where((t) => t.name.contains(name))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<CaffeineItem>?> searchtMenuItems(String name) async {
    return await (_db.select(_db.caffeineItems)
          ..where((t) => t.name.contains(name))
          ..limit(5))
        .get();
  }

  Future<List<CaffeineItem>?> getFavorites() async {
    return await (_db.select(
            _db.caffeineItems,
          )
          ..orderBy(
            [
              (t) => OrderingTerm.desc(t.hits),
            ],
          )
          ..limit(7))
        .get();
  }
}

final menuRepositoryProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return MenuRepository(db);
});
