import 'package:freezed_annotation/freezed_annotation.dart';

part 'myinfo_model.freezed.dart';
part 'myinfo_model.g.dart';

enum Gender {
  male('남성'),
  female('여성')
  ;

  final String label;
  const Gender(this.label);
}

@freezed
abstract class MyInfoModel with _$MyInfoModel {
  const factory MyInfoModel({
    required Gender gender,
    required double weight,
    required int age,
    required bool smoking,
  }) = _MyInfoModel;

  factory MyInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MyInfoModelFromJson(json);
}
