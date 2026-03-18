part of 'db.dart';

class CaffeineItems extends Table {
  // ID
  IntColumn get id => integer().autoIncrement()();

  // 메뉴 이름
  TextColumn get name => text().withLength(min: 1, max: 255)();

  // 브랜드 이름
  // 없을 수도 있음
  TextColumn get brand => text().nullable()();

  // 음료 양
  TextColumn get serviceSize => text().withDefault(const Constant(''))();

  // 카페인 양
  RealColumn get caffeineAmount => real().withDefault(const Constant(0.0))();

  // 직접 추가 여부
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();

  // 자주 찾는 음료
  IntColumn get hits => integer().withDefault(const Constant(0))();
}

class MyInfos extends Table {
  // ID
  IntColumn get id => integer().autoIncrement()();

  // 나이
  IntColumn get age => integer().withDefault(const Constant(0))();

  // 몸무게
  RealColumn get weight => real().withDefault(const Constant(0.0))();

  // 흡연
  BoolColumn get isSmoking => boolean().withDefault(const Constant(false))();

  // 성별
  IntColumn get genderIndex => intEnum<Gender>()();
}

class Reports extends Table {
  // ID
  IntColumn get id => integer().autoIncrement()();

  IntColumn get itemId => integer().references(
    CaffeineItems,
    #id,
    onDelete: KeyAction.cascade,
  )();

  DateTimeColumn get drinkDateAt =>
      dateTime().withDefault(currentDateAndTime)();
}
