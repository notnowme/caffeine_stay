// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $CaffeineItemsTable extends CaffeineItems
    with TableInfo<$CaffeineItemsTable, CaffeineItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaffeineItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serviceSizeMeta = const VerificationMeta(
    'serviceSize',
  );
  @override
  late final GeneratedColumn<String> serviceSize = GeneratedColumn<String>(
    'service_size',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _caffeineAmountMeta = const VerificationMeta(
    'caffeineAmount',
  );
  @override
  late final GeneratedColumn<double> caffeineAmount = GeneratedColumn<double>(
    'caffeine_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hitsMeta = const VerificationMeta('hits');
  @override
  late final GeneratedColumn<int> hits = GeneratedColumn<int>(
    'hits',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    brand,
    serviceSize,
    caffeineAmount,
    isCustom,
    hits,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'caffeine_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaffeineItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('service_size')) {
      context.handle(
        _serviceSizeMeta,
        serviceSize.isAcceptableOrUnknown(
          data['service_size']!,
          _serviceSizeMeta,
        ),
      );
    }
    if (data.containsKey('caffeine_amount')) {
      context.handle(
        _caffeineAmountMeta,
        caffeineAmount.isAcceptableOrUnknown(
          data['caffeine_amount']!,
          _caffeineAmountMeta,
        ),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    if (data.containsKey('hits')) {
      context.handle(
        _hitsMeta,
        hits.isAcceptableOrUnknown(data['hits']!, _hitsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaffeineItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaffeineItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      serviceSize: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_size'],
      )!,
      caffeineAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}caffeine_amount'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
      hits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hits'],
      )!,
    );
  }

  @override
  $CaffeineItemsTable createAlias(String alias) {
    return $CaffeineItemsTable(attachedDatabase, alias);
  }
}

class CaffeineItem extends DataClass implements Insertable<CaffeineItem> {
  final int id;
  final String name;
  final String? brand;
  final String serviceSize;
  final double caffeineAmount;
  final bool isCustom;
  final int hits;
  const CaffeineItem({
    required this.id,
    required this.name,
    this.brand,
    required this.serviceSize,
    required this.caffeineAmount,
    required this.isCustom,
    required this.hits,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    map['service_size'] = Variable<String>(serviceSize);
    map['caffeine_amount'] = Variable<double>(caffeineAmount);
    map['is_custom'] = Variable<bool>(isCustom);
    map['hits'] = Variable<int>(hits);
    return map;
  }

  CaffeineItemsCompanion toCompanion(bool nullToAbsent) {
    return CaffeineItemsCompanion(
      id: Value(id),
      name: Value(name),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      serviceSize: Value(serviceSize),
      caffeineAmount: Value(caffeineAmount),
      isCustom: Value(isCustom),
      hits: Value(hits),
    );
  }

  factory CaffeineItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaffeineItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      brand: serializer.fromJson<String?>(json['brand']),
      serviceSize: serializer.fromJson<String>(json['serviceSize']),
      caffeineAmount: serializer.fromJson<double>(json['caffeineAmount']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      hits: serializer.fromJson<int>(json['hits']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'brand': serializer.toJson<String?>(brand),
      'serviceSize': serializer.toJson<String>(serviceSize),
      'caffeineAmount': serializer.toJson<double>(caffeineAmount),
      'isCustom': serializer.toJson<bool>(isCustom),
      'hits': serializer.toJson<int>(hits),
    };
  }

  CaffeineItem copyWith({
    int? id,
    String? name,
    Value<String?> brand = const Value.absent(),
    String? serviceSize,
    double? caffeineAmount,
    bool? isCustom,
    int? hits,
  }) => CaffeineItem(
    id: id ?? this.id,
    name: name ?? this.name,
    brand: brand.present ? brand.value : this.brand,
    serviceSize: serviceSize ?? this.serviceSize,
    caffeineAmount: caffeineAmount ?? this.caffeineAmount,
    isCustom: isCustom ?? this.isCustom,
    hits: hits ?? this.hits,
  );
  CaffeineItem copyWithCompanion(CaffeineItemsCompanion data) {
    return CaffeineItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      brand: data.brand.present ? data.brand.value : this.brand,
      serviceSize: data.serviceSize.present
          ? data.serviceSize.value
          : this.serviceSize,
      caffeineAmount: data.caffeineAmount.present
          ? data.caffeineAmount.value
          : this.caffeineAmount,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      hits: data.hits.present ? data.hits.value : this.hits,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaffeineItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('serviceSize: $serviceSize, ')
          ..write('caffeineAmount: $caffeineAmount, ')
          ..write('isCustom: $isCustom, ')
          ..write('hits: $hits')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, brand, serviceSize, caffeineAmount, isCustom, hits);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaffeineItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.serviceSize == this.serviceSize &&
          other.caffeineAmount == this.caffeineAmount &&
          other.isCustom == this.isCustom &&
          other.hits == this.hits);
}

class CaffeineItemsCompanion extends UpdateCompanion<CaffeineItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> brand;
  final Value<String> serviceSize;
  final Value<double> caffeineAmount;
  final Value<bool> isCustom;
  final Value<int> hits;
  const CaffeineItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.serviceSize = const Value.absent(),
    this.caffeineAmount = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.hits = const Value.absent(),
  });
  CaffeineItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.brand = const Value.absent(),
    this.serviceSize = const Value.absent(),
    this.caffeineAmount = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.hits = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CaffeineItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<String>? serviceSize,
    Expression<double>? caffeineAmount,
    Expression<bool>? isCustom,
    Expression<int>? hits,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (serviceSize != null) 'service_size': serviceSize,
      if (caffeineAmount != null) 'caffeine_amount': caffeineAmount,
      if (isCustom != null) 'is_custom': isCustom,
      if (hits != null) 'hits': hits,
    });
  }

  CaffeineItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? brand,
    Value<String>? serviceSize,
    Value<double>? caffeineAmount,
    Value<bool>? isCustom,
    Value<int>? hits,
  }) {
    return CaffeineItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      serviceSize: serviceSize ?? this.serviceSize,
      caffeineAmount: caffeineAmount ?? this.caffeineAmount,
      isCustom: isCustom ?? this.isCustom,
      hits: hits ?? this.hits,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (serviceSize.present) {
      map['service_size'] = Variable<String>(serviceSize.value);
    }
    if (caffeineAmount.present) {
      map['caffeine_amount'] = Variable<double>(caffeineAmount.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (hits.present) {
      map['hits'] = Variable<int>(hits.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaffeineItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('serviceSize: $serviceSize, ')
          ..write('caffeineAmount: $caffeineAmount, ')
          ..write('isCustom: $isCustom, ')
          ..write('hits: $hits')
          ..write(')'))
        .toString();
  }
}

class $MyInfosTable extends MyInfos with TableInfo<$MyInfosTable, MyInfo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyInfosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _isSmokingMeta = const VerificationMeta(
    'isSmoking',
  );
  @override
  late final GeneratedColumn<bool> isSmoking = GeneratedColumn<bool>(
    'is_smoking',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_smoking" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Gender, int> genderIndex =
      GeneratedColumn<int>(
        'gender_index',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Gender>($MyInfosTable.$convertergenderIndex);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    age,
    weight,
    isSmoking,
    genderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_infos';
  @override
  VerificationContext validateIntegrity(
    Insertable<MyInfo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('is_smoking')) {
      context.handle(
        _isSmokingMeta,
        isSmoking.isAcceptableOrUnknown(data['is_smoking']!, _isSmokingMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyInfo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyInfo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      isSmoking: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_smoking'],
      )!,
      genderIndex: $MyInfosTable.$convertergenderIndex.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}gender_index'],
        )!,
      ),
    );
  }

  @override
  $MyInfosTable createAlias(String alias) {
    return $MyInfosTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Gender, int, int> $convertergenderIndex =
      const EnumIndexConverter<Gender>(Gender.values);
}

class MyInfo extends DataClass implements Insertable<MyInfo> {
  final int id;
  final int age;
  final double weight;
  final bool isSmoking;
  final Gender genderIndex;
  const MyInfo({
    required this.id,
    required this.age,
    required this.weight,
    required this.isSmoking,
    required this.genderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['age'] = Variable<int>(age);
    map['weight'] = Variable<double>(weight);
    map['is_smoking'] = Variable<bool>(isSmoking);
    {
      map['gender_index'] = Variable<int>(
        $MyInfosTable.$convertergenderIndex.toSql(genderIndex),
      );
    }
    return map;
  }

  MyInfosCompanion toCompanion(bool nullToAbsent) {
    return MyInfosCompanion(
      id: Value(id),
      age: Value(age),
      weight: Value(weight),
      isSmoking: Value(isSmoking),
      genderIndex: Value(genderIndex),
    );
  }

  factory MyInfo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyInfo(
      id: serializer.fromJson<int>(json['id']),
      age: serializer.fromJson<int>(json['age']),
      weight: serializer.fromJson<double>(json['weight']),
      isSmoking: serializer.fromJson<bool>(json['isSmoking']),
      genderIndex: $MyInfosTable.$convertergenderIndex.fromJson(
        serializer.fromJson<int>(json['genderIndex']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'age': serializer.toJson<int>(age),
      'weight': serializer.toJson<double>(weight),
      'isSmoking': serializer.toJson<bool>(isSmoking),
      'genderIndex': serializer.toJson<int>(
        $MyInfosTable.$convertergenderIndex.toJson(genderIndex),
      ),
    };
  }

  MyInfo copyWith({
    int? id,
    int? age,
    double? weight,
    bool? isSmoking,
    Gender? genderIndex,
  }) => MyInfo(
    id: id ?? this.id,
    age: age ?? this.age,
    weight: weight ?? this.weight,
    isSmoking: isSmoking ?? this.isSmoking,
    genderIndex: genderIndex ?? this.genderIndex,
  );
  MyInfo copyWithCompanion(MyInfosCompanion data) {
    return MyInfo(
      id: data.id.present ? data.id.value : this.id,
      age: data.age.present ? data.age.value : this.age,
      weight: data.weight.present ? data.weight.value : this.weight,
      isSmoking: data.isSmoking.present ? data.isSmoking.value : this.isSmoking,
      genderIndex: data.genderIndex.present
          ? data.genderIndex.value
          : this.genderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MyInfo(')
          ..write('id: $id, ')
          ..write('age: $age, ')
          ..write('weight: $weight, ')
          ..write('isSmoking: $isSmoking, ')
          ..write('genderIndex: $genderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, age, weight, isSmoking, genderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyInfo &&
          other.id == this.id &&
          other.age == this.age &&
          other.weight == this.weight &&
          other.isSmoking == this.isSmoking &&
          other.genderIndex == this.genderIndex);
}

class MyInfosCompanion extends UpdateCompanion<MyInfo> {
  final Value<int> id;
  final Value<int> age;
  final Value<double> weight;
  final Value<bool> isSmoking;
  final Value<Gender> genderIndex;
  const MyInfosCompanion({
    this.id = const Value.absent(),
    this.age = const Value.absent(),
    this.weight = const Value.absent(),
    this.isSmoking = const Value.absent(),
    this.genderIndex = const Value.absent(),
  });
  MyInfosCompanion.insert({
    this.id = const Value.absent(),
    this.age = const Value.absent(),
    this.weight = const Value.absent(),
    this.isSmoking = const Value.absent(),
    required Gender genderIndex,
  }) : genderIndex = Value(genderIndex);
  static Insertable<MyInfo> custom({
    Expression<int>? id,
    Expression<int>? age,
    Expression<double>? weight,
    Expression<bool>? isSmoking,
    Expression<int>? genderIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (age != null) 'age': age,
      if (weight != null) 'weight': weight,
      if (isSmoking != null) 'is_smoking': isSmoking,
      if (genderIndex != null) 'gender_index': genderIndex,
    });
  }

  MyInfosCompanion copyWith({
    Value<int>? id,
    Value<int>? age,
    Value<double>? weight,
    Value<bool>? isSmoking,
    Value<Gender>? genderIndex,
  }) {
    return MyInfosCompanion(
      id: id ?? this.id,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      isSmoking: isSmoking ?? this.isSmoking,
      genderIndex: genderIndex ?? this.genderIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (isSmoking.present) {
      map['is_smoking'] = Variable<bool>(isSmoking.value);
    }
    if (genderIndex.present) {
      map['gender_index'] = Variable<int>(
        $MyInfosTable.$convertergenderIndex.toSql(genderIndex.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyInfosCompanion(')
          ..write('id: $id, ')
          ..write('age: $age, ')
          ..write('weight: $weight, ')
          ..write('isSmoking: $isSmoking, ')
          ..write('genderIndex: $genderIndex')
          ..write(')'))
        .toString();
  }
}

class $ReportsTable extends Reports with TableInfo<$ReportsTable, Report> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES caffeine_items (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _drinkDateAtMeta = const VerificationMeta(
    'drinkDateAt',
  );
  @override
  late final GeneratedColumn<DateTime> drinkDateAt = GeneratedColumn<DateTime>(
    'drink_date_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, itemId, drinkDateAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<Report> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('drink_date_at')) {
      context.handle(
        _drinkDateAtMeta,
        drinkDateAt.isAcceptableOrUnknown(
          data['drink_date_at']!,
          _drinkDateAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Report map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Report(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_id'],
      )!,
      drinkDateAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}drink_date_at'],
      )!,
    );
  }

  @override
  $ReportsTable createAlias(String alias) {
    return $ReportsTable(attachedDatabase, alias);
  }
}

class Report extends DataClass implements Insertable<Report> {
  final int id;
  final int itemId;
  final DateTime drinkDateAt;
  const Report({
    required this.id,
    required this.itemId,
    required this.drinkDateAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['drink_date_at'] = Variable<DateTime>(drinkDateAt);
    return map;
  }

  ReportsCompanion toCompanion(bool nullToAbsent) {
    return ReportsCompanion(
      id: Value(id),
      itemId: Value(itemId),
      drinkDateAt: Value(drinkDateAt),
    );
  }

  factory Report.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Report(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      drinkDateAt: serializer.fromJson<DateTime>(json['drinkDateAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'drinkDateAt': serializer.toJson<DateTime>(drinkDateAt),
    };
  }

  Report copyWith({int? id, int? itemId, DateTime? drinkDateAt}) => Report(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    drinkDateAt: drinkDateAt ?? this.drinkDateAt,
  );
  Report copyWithCompanion(ReportsCompanion data) {
    return Report(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      drinkDateAt: data.drinkDateAt.present
          ? data.drinkDateAt.value
          : this.drinkDateAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Report(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('drinkDateAt: $drinkDateAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, drinkDateAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Report &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.drinkDateAt == this.drinkDateAt);
}

class ReportsCompanion extends UpdateCompanion<Report> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<DateTime> drinkDateAt;
  const ReportsCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.drinkDateAt = const Value.absent(),
  });
  ReportsCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    this.drinkDateAt = const Value.absent(),
  }) : itemId = Value(itemId);
  static Insertable<Report> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<DateTime>? drinkDateAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (drinkDateAt != null) 'drink_date_at': drinkDateAt,
    });
  }

  ReportsCompanion copyWith({
    Value<int>? id,
    Value<int>? itemId,
    Value<DateTime>? drinkDateAt,
  }) {
    return ReportsCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      drinkDateAt: drinkDateAt ?? this.drinkDateAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (drinkDateAt.present) {
      map['drink_date_at'] = Variable<DateTime>(drinkDateAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportsCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('drinkDateAt: $drinkDateAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(e);
  $AppDataBaseManager get managers => $AppDataBaseManager(this);
  late final $CaffeineItemsTable caffeineItems = $CaffeineItemsTable(this);
  late final $MyInfosTable myInfos = $MyInfosTable(this);
  late final $ReportsTable reports = $ReportsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    caffeineItems,
    myInfos,
    reports,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'caffeine_items',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reports', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CaffeineItemsTableCreateCompanionBuilder =
    CaffeineItemsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> brand,
      Value<String> serviceSize,
      Value<double> caffeineAmount,
      Value<bool> isCustom,
      Value<int> hits,
    });
typedef $$CaffeineItemsTableUpdateCompanionBuilder =
    CaffeineItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> brand,
      Value<String> serviceSize,
      Value<double> caffeineAmount,
      Value<bool> isCustom,
      Value<int> hits,
    });

final class $$CaffeineItemsTableReferences
    extends BaseReferences<_$AppDataBase, $CaffeineItemsTable, CaffeineItem> {
  $$CaffeineItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ReportsTable, List<Report>> _reportsRefsTable(
    _$AppDataBase db,
  ) => MultiTypedResultKey.fromTable(
    db.reports,
    aliasName: $_aliasNameGenerator(db.caffeineItems.id, db.reports.itemId),
  );

  $$ReportsTableProcessedTableManager get reportsRefs {
    final manager = $$ReportsTableTableManager(
      $_db,
      $_db.reports,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CaffeineItemsTableFilterComposer
    extends Composer<_$AppDataBase, $CaffeineItemsTable> {
  $$CaffeineItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceSize => $composableBuilder(
    column: $table.serviceSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get caffeineAmount => $composableBuilder(
    column: $table.caffeineAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hits => $composableBuilder(
    column: $table.hits,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reportsRefs(
    Expression<bool> Function($$ReportsTableFilterComposer f) f,
  ) {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableFilterComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CaffeineItemsTableOrderingComposer
    extends Composer<_$AppDataBase, $CaffeineItemsTable> {
  $$CaffeineItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceSize => $composableBuilder(
    column: $table.serviceSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get caffeineAmount => $composableBuilder(
    column: $table.caffeineAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hits => $composableBuilder(
    column: $table.hits,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CaffeineItemsTableAnnotationComposer
    extends Composer<_$AppDataBase, $CaffeineItemsTable> {
  $$CaffeineItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get serviceSize => $composableBuilder(
    column: $table.serviceSize,
    builder: (column) => column,
  );

  GeneratedColumn<double> get caffeineAmount => $composableBuilder(
    column: $table.caffeineAmount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<int> get hits =>
      $composableBuilder(column: $table.hits, builder: (column) => column);

  Expression<T> reportsRefs<T extends Object>(
    Expression<T> Function($$ReportsTableAnnotationComposer a) f,
  ) {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CaffeineItemsTableTableManager
    extends
        RootTableManager<
          _$AppDataBase,
          $CaffeineItemsTable,
          CaffeineItem,
          $$CaffeineItemsTableFilterComposer,
          $$CaffeineItemsTableOrderingComposer,
          $$CaffeineItemsTableAnnotationComposer,
          $$CaffeineItemsTableCreateCompanionBuilder,
          $$CaffeineItemsTableUpdateCompanionBuilder,
          (CaffeineItem, $$CaffeineItemsTableReferences),
          CaffeineItem,
          PrefetchHooks Function({bool reportsRefs})
        > {
  $$CaffeineItemsTableTableManager(_$AppDataBase db, $CaffeineItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaffeineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaffeineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaffeineItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String> serviceSize = const Value.absent(),
                Value<double> caffeineAmount = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int> hits = const Value.absent(),
              }) => CaffeineItemsCompanion(
                id: id,
                name: name,
                brand: brand,
                serviceSize: serviceSize,
                caffeineAmount: caffeineAmount,
                isCustom: isCustom,
                hits: hits,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> brand = const Value.absent(),
                Value<String> serviceSize = const Value.absent(),
                Value<double> caffeineAmount = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int> hits = const Value.absent(),
              }) => CaffeineItemsCompanion.insert(
                id: id,
                name: name,
                brand: brand,
                serviceSize: serviceSize,
                caffeineAmount: caffeineAmount,
                isCustom: isCustom,
                hits: hits,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CaffeineItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reportsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (reportsRefs) db.reports],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reportsRefs)
                    await $_getPrefetchedData<
                      CaffeineItem,
                      $CaffeineItemsTable,
                      Report
                    >(
                      currentTable: table,
                      referencedTable: $$CaffeineItemsTableReferences
                          ._reportsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CaffeineItemsTableReferences(
                            db,
                            table,
                            p0,
                          ).reportsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.itemId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CaffeineItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDataBase,
      $CaffeineItemsTable,
      CaffeineItem,
      $$CaffeineItemsTableFilterComposer,
      $$CaffeineItemsTableOrderingComposer,
      $$CaffeineItemsTableAnnotationComposer,
      $$CaffeineItemsTableCreateCompanionBuilder,
      $$CaffeineItemsTableUpdateCompanionBuilder,
      (CaffeineItem, $$CaffeineItemsTableReferences),
      CaffeineItem,
      PrefetchHooks Function({bool reportsRefs})
    >;
typedef $$MyInfosTableCreateCompanionBuilder =
    MyInfosCompanion Function({
      Value<int> id,
      Value<int> age,
      Value<double> weight,
      Value<bool> isSmoking,
      required Gender genderIndex,
    });
typedef $$MyInfosTableUpdateCompanionBuilder =
    MyInfosCompanion Function({
      Value<int> id,
      Value<int> age,
      Value<double> weight,
      Value<bool> isSmoking,
      Value<Gender> genderIndex,
    });

class $$MyInfosTableFilterComposer
    extends Composer<_$AppDataBase, $MyInfosTable> {
  $$MyInfosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSmoking => $composableBuilder(
    column: $table.isSmoking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Gender, Gender, int> get genderIndex =>
      $composableBuilder(
        column: $table.genderIndex,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$MyInfosTableOrderingComposer
    extends Composer<_$AppDataBase, $MyInfosTable> {
  $$MyInfosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSmoking => $composableBuilder(
    column: $table.isSmoking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get genderIndex => $composableBuilder(
    column: $table.genderIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MyInfosTableAnnotationComposer
    extends Composer<_$AppDataBase, $MyInfosTable> {
  $$MyInfosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<bool> get isSmoking =>
      $composableBuilder(column: $table.isSmoking, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Gender, int> get genderIndex =>
      $composableBuilder(
        column: $table.genderIndex,
        builder: (column) => column,
      );
}

class $$MyInfosTableTableManager
    extends
        RootTableManager<
          _$AppDataBase,
          $MyInfosTable,
          MyInfo,
          $$MyInfosTableFilterComposer,
          $$MyInfosTableOrderingComposer,
          $$MyInfosTableAnnotationComposer,
          $$MyInfosTableCreateCompanionBuilder,
          $$MyInfosTableUpdateCompanionBuilder,
          (MyInfo, BaseReferences<_$AppDataBase, $MyInfosTable, MyInfo>),
          MyInfo,
          PrefetchHooks Function()
        > {
  $$MyInfosTableTableManager(_$AppDataBase db, $MyInfosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MyInfosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MyInfosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MyInfosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<bool> isSmoking = const Value.absent(),
                Value<Gender> genderIndex = const Value.absent(),
              }) => MyInfosCompanion(
                id: id,
                age: age,
                weight: weight,
                isSmoking: isSmoking,
                genderIndex: genderIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<bool> isSmoking = const Value.absent(),
                required Gender genderIndex,
              }) => MyInfosCompanion.insert(
                id: id,
                age: age,
                weight: weight,
                isSmoking: isSmoking,
                genderIndex: genderIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MyInfosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDataBase,
      $MyInfosTable,
      MyInfo,
      $$MyInfosTableFilterComposer,
      $$MyInfosTableOrderingComposer,
      $$MyInfosTableAnnotationComposer,
      $$MyInfosTableCreateCompanionBuilder,
      $$MyInfosTableUpdateCompanionBuilder,
      (MyInfo, BaseReferences<_$AppDataBase, $MyInfosTable, MyInfo>),
      MyInfo,
      PrefetchHooks Function()
    >;
typedef $$ReportsTableCreateCompanionBuilder =
    ReportsCompanion Function({
      Value<int> id,
      required int itemId,
      Value<DateTime> drinkDateAt,
    });
typedef $$ReportsTableUpdateCompanionBuilder =
    ReportsCompanion Function({
      Value<int> id,
      Value<int> itemId,
      Value<DateTime> drinkDateAt,
    });

final class $$ReportsTableReferences
    extends BaseReferences<_$AppDataBase, $ReportsTable, Report> {
  $$ReportsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CaffeineItemsTable _itemIdTable(_$AppDataBase db) =>
      db.caffeineItems.createAlias(
        $_aliasNameGenerator(db.reports.itemId, db.caffeineItems.id),
      );

  $$CaffeineItemsTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<int>('item_id')!;

    final manager = $$CaffeineItemsTableTableManager(
      $_db,
      $_db.caffeineItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReportsTableFilterComposer
    extends Composer<_$AppDataBase, $ReportsTable> {
  $$ReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get drinkDateAt => $composableBuilder(
    column: $table.drinkDateAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CaffeineItemsTableFilterComposer get itemId {
    final $$CaffeineItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.caffeineItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaffeineItemsTableFilterComposer(
            $db: $db,
            $table: $db.caffeineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportsTableOrderingComposer
    extends Composer<_$AppDataBase, $ReportsTable> {
  $$ReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get drinkDateAt => $composableBuilder(
    column: $table.drinkDateAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CaffeineItemsTableOrderingComposer get itemId {
    final $$CaffeineItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.caffeineItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaffeineItemsTableOrderingComposer(
            $db: $db,
            $table: $db.caffeineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportsTableAnnotationComposer
    extends Composer<_$AppDataBase, $ReportsTable> {
  $$ReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get drinkDateAt => $composableBuilder(
    column: $table.drinkDateAt,
    builder: (column) => column,
  );

  $$CaffeineItemsTableAnnotationComposer get itemId {
    final $$CaffeineItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.caffeineItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaffeineItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.caffeineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportsTableTableManager
    extends
        RootTableManager<
          _$AppDataBase,
          $ReportsTable,
          Report,
          $$ReportsTableFilterComposer,
          $$ReportsTableOrderingComposer,
          $$ReportsTableAnnotationComposer,
          $$ReportsTableCreateCompanionBuilder,
          $$ReportsTableUpdateCompanionBuilder,
          (Report, $$ReportsTableReferences),
          Report,
          PrefetchHooks Function({bool itemId})
        > {
  $$ReportsTableTableManager(_$AppDataBase db, $ReportsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> itemId = const Value.absent(),
                Value<DateTime> drinkDateAt = const Value.absent(),
              }) => ReportsCompanion(
                id: id,
                itemId: itemId,
                drinkDateAt: drinkDateAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int itemId,
                Value<DateTime> drinkDateAt = const Value.absent(),
              }) => ReportsCompanion.insert(
                id: id,
                itemId: itemId,
                drinkDateAt: drinkDateAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReportsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({itemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.itemId,
                                referencedTable: $$ReportsTableReferences
                                    ._itemIdTable(db),
                                referencedColumn: $$ReportsTableReferences
                                    ._itemIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDataBase,
      $ReportsTable,
      Report,
      $$ReportsTableFilterComposer,
      $$ReportsTableOrderingComposer,
      $$ReportsTableAnnotationComposer,
      $$ReportsTableCreateCompanionBuilder,
      $$ReportsTableUpdateCompanionBuilder,
      (Report, $$ReportsTableReferences),
      Report,
      PrefetchHooks Function({bool itemId})
    >;

class $AppDataBaseManager {
  final _$AppDataBase _db;
  $AppDataBaseManager(this._db);
  $$CaffeineItemsTableTableManager get caffeineItems =>
      $$CaffeineItemsTableTableManager(_db, _db.caffeineItems);
  $$MyInfosTableTableManager get myInfos =>
      $$MyInfosTableTableManager(_db, _db.myInfos);
  $$ReportsTableTableManager get reports =>
      $$ReportsTableTableManager(_db, _db.reports);
}
