import 'package:freezed_annotation/freezed_annotation.dart';

part 'caffeine_item.freezed.dart';
part 'caffeine_item.g.dart';

@freezed
abstract class CaffeineItemModel with _$CaffeineItemModel {
  const factory CaffeineItemModel({
    required int id,
    required String name,
    String? brand,
    required String serviceSize,
    required double caffeineAmount,
    required bool isCustom,
    required int hits,
  }) = _CaffeineItemModel;

  factory CaffeineItemModel.fromGviz(Map<String, dynamic> json) {
    return CaffeineItemModel(
      id: 0,
      name: json['FOOD_NM_KR']?.toString() ?? '',
      brand: json['MAKER_NM']?.toString(),
      serviceSize: json['SERVING_SIZE']?.toString() ?? '',
      caffeineAmount: double.tryParse(json['AMT_NUM100'].toString()) ?? 0.0,
      isCustom: false,
      hits: 0,
    );
  }

  factory CaffeineItemModel.fromJson(Map<String, dynamic> json) =>
      _$CaffeineItemModelFromJson(json);
}
