import 'package:caffeine_stay/common/db/db.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoRepository {
  final AppDataBase _db;
  InfoRepository(this._db);

  Future<void> saveMyInfo(MyInfoModel info) async {
    final companion = MyInfosCompanion(
      id: const Value(1),
      age: Value(info.age),
      weight: Value(info.weight),
      isSmoking: Value(info.smoking),
      genderIndex: Value(info.gender),
    );

    await _db.into(_db.myInfos).insertOnConflictUpdate(companion);
  }

  Future<MyInfoModel?> getMyInfo() async {
    final info = await (_db.select(
      _db.myInfos,
    )..where((t) => t.id.equals(1))).getSingleOrNull();
    if (info == null) return null;
    return MyInfoModel(
      gender: info.genderIndex,
      weight: info.weight,
      age: info.age,
      smoking: info.isSmoking,
    );
  }
}

final infoRepositoryProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return InfoRepository(db);
});
