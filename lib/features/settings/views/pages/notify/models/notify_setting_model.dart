import 'package:freezed_annotation/freezed_annotation.dart';

part 'notify_setting_model.freezed.dart';
part 'notify_setting_model.g.dart';

@freezed
abstract class NotifySettingModel with _$NotifySettingModel {
  const factory NotifySettingModel({
    required bool rebound,
    required bool hydrate,
  }) = _NotifySettingModel;

  factory NotifySettingModel.empty() => const NotifySettingModel(
    hydrate: false,
    rebound: false,
  );

  factory NotifySettingModel.fromJson(Map<String, dynamic> json) =>
      _$NotifySettingModelFromJson(json);
}
