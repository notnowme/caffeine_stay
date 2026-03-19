import 'package:caffeine_stay/common/db/db.dart';
import 'package:caffeine_stay/features/menu/models/report_with_menu_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuRepository {
  final AppDataBase _db;
  MenuRepository(this._db);

  /// 마신 카페인을 추가합니다.
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

  /// Duration을 받아 Duration부터 현재까지의 데이터를 가져옵니다.
  /// ex) 12시간 전부터 지금까지
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

  /// 특정 시간대의 데이터를 가져옵니다.
  /// 12시간 전 ~ 6시간 전 사이.
  Future<List<ReportWithMenuModel>?> getDataBetweenDate(
    Duration start,
    Duration end,
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
                    start,
                  ),
                ) &
                _db.reports.drinkDateAt.isSmallerThanValue(
                  DateTime.now().subtract(end),
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

  /// 이름으로 단일 데이터를 가져옵니다.
  Future<CaffeineItem?> getMenuItem(String name) async {
    return await (_db.select(_db.caffeineItems)
          ..where((t) => t.name.contains(name))
          ..limit(1))
        .getSingleOrNull();
  }

  /// 이름으로 검색하여, 원하는 수만큼 가져옵니다.
  Future<List<CaffeineItem>?> searchtMenuItems(
    String name, {
    int limit = 5,
  }) async {
    return await (_db.select(_db.caffeineItems)
          ..where((t) => t.name.contains(name))
          ..limit(limit))
        .get();
  }

  /// 자주 추가한 상위 7개 데이터를 가져옵니다.
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

/// 메뉴 테이블에 접근하는 프로바이더
final menuRepositoryProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return MenuRepository(db);
});
