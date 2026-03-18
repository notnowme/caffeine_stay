// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caffeine_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CaffeineItemModel _$CaffeineItemModelFromJson(Map<String, dynamic> json) =>
    _CaffeineItemModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brand: json['brand'] as String?,
      serviceSize: json['serviceSize'] as String,
      caffeineAmount: (json['caffeineAmount'] as num).toDouble(),
      isCustom: json['isCustom'] as bool,
      hits: (json['hits'] as num).toInt(),
    );

Map<String, dynamic> _$CaffeineItemModelToJson(_CaffeineItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'serviceSize': instance.serviceSize,
      'caffeineAmount': instance.caffeineAmount,
      'isCustom': instance.isCustom,
      'hits': instance.hits,
    };
