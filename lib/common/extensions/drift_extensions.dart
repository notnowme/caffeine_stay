import 'package:caffeine_stay/common/db/db.dart';
import 'package:caffeine_stay/common/db/models/caffeine_item.dart';
import 'package:caffeine_stay/features/onboard/models/myinfo_model.dart';
import 'package:drift/drift.dart';

// Drift에 넣으려면 변환해야 함
extension CaffeineItemModelEx on CaffeineItemModel {
  CaffeineItemsCompanion toCompanion() {
    return CaffeineItemsCompanion.insert(
      name: name,
      brand: Value(brand),
      serviceSize: Value(serviceSize),
      caffeineAmount: Value(caffeineAmount),
      isCustom: Value(isCustom),
      hits: Value(hits),
    );
  }
}

extension MyInfoModelEx on MyInfoModel {
  MyInfosCompanion toCompanion() {
    return MyInfosCompanion.insert(
      age: Value(age),
      weight: Value(weight),
      isSmoking: Value(smoking),
      genderIndex: gender,
    );
  }
}
