import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'tables.dart';
part 'db.g.dart';

final databaseProvider = Provider((ref) {
  return AppDataBase();
});

const tables = [
  CaffeineItems,
  MyInfos,
  Reports,
];

@DriftDatabase(tables: tables)
class AppDataBase extends _$AppDataBase {
  AppDataBase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      // 스키마 버전이 낮을 경우 마이그레이션
      if (from < schemaVersion) {
        await m.createTable(reports);
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<void> refreshPublicData(List<CaffeineItemsCompanion> newItems) async {
    await transaction(() async {
      // 커스텀 데이터는 남기고 공공데이터만 삭제
      await (delete(
        caffeineItems,
      )..where((t) => t.isCustom.equals(false))).go();

      // 새 데이터 삽입
      await batch((batch) {
        batch.insertAll(
          caffeineItems,
          newItems,
          mode: InsertMode.insertOrReplace,
        );
      });
    });
  }

  Selectable<CaffeineItem> searchBeverages(String query) {
    return select(caffeineItems)
      ..where((t) => t.name.contains(query) | t.brand.contains(query))
      ..orderBy([
        (t) => OrderingTerm(expression: t.isCustom, mode: OrderingMode.desc),
      ]);
  }
}
