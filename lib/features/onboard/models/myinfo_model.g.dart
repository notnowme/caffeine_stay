// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myinfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyInfoModel _$MyInfoModelFromJson(Map<String, dynamic> json) => _MyInfoModel(
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  weight: (json['weight'] as num).toDouble(),
  age: (json['age'] as num).toInt(),
  smoking: json['smoking'] as bool,
);

Map<String, dynamic> _$MyInfoModelToJson(_MyInfoModel instance) =>
    <String, dynamic>{
      'gender': _$GenderEnumMap[instance.gender]!,
      'weight': instance.weight,
      'age': instance.age,
      'smoking': instance.smoking,
    };

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};
