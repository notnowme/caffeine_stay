// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notify_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotifySettingModel {

 bool get rebound; bool get hydrate;
/// Create a copy of NotifySettingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotifySettingModelCopyWith<NotifySettingModel> get copyWith => _$NotifySettingModelCopyWithImpl<NotifySettingModel>(this as NotifySettingModel, _$identity);

  /// Serializes this NotifySettingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotifySettingModel&&(identical(other.rebound, rebound) || other.rebound == rebound)&&(identical(other.hydrate, hydrate) || other.hydrate == hydrate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rebound,hydrate);

@override
String toString() {
  return 'NotifySettingModel(rebound: $rebound, hydrate: $hydrate)';
}


}

/// @nodoc
abstract mixin class $NotifySettingModelCopyWith<$Res>  {
  factory $NotifySettingModelCopyWith(NotifySettingModel value, $Res Function(NotifySettingModel) _then) = _$NotifySettingModelCopyWithImpl;
@useResult
$Res call({
 bool rebound, bool hydrate
});




}
/// @nodoc
class _$NotifySettingModelCopyWithImpl<$Res>
    implements $NotifySettingModelCopyWith<$Res> {
  _$NotifySettingModelCopyWithImpl(this._self, this._then);

  final NotifySettingModel _self;
  final $Res Function(NotifySettingModel) _then;

/// Create a copy of NotifySettingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rebound = null,Object? hydrate = null,}) {
  return _then(_self.copyWith(
rebound: null == rebound ? _self.rebound : rebound // ignore: cast_nullable_to_non_nullable
as bool,hydrate: null == hydrate ? _self.hydrate : hydrate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotifySettingModel].
extension NotifySettingModelPatterns on NotifySettingModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotifySettingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotifySettingModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotifySettingModel value)  $default,){
final _that = this;
switch (_that) {
case _NotifySettingModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotifySettingModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotifySettingModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool rebound,  bool hydrate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotifySettingModel() when $default != null:
return $default(_that.rebound,_that.hydrate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool rebound,  bool hydrate)  $default,) {final _that = this;
switch (_that) {
case _NotifySettingModel():
return $default(_that.rebound,_that.hydrate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool rebound,  bool hydrate)?  $default,) {final _that = this;
switch (_that) {
case _NotifySettingModel() when $default != null:
return $default(_that.rebound,_that.hydrate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotifySettingModel implements NotifySettingModel {
  const _NotifySettingModel({required this.rebound, required this.hydrate});
  factory _NotifySettingModel.fromJson(Map<String, dynamic> json) => _$NotifySettingModelFromJson(json);

@override final  bool rebound;
@override final  bool hydrate;

/// Create a copy of NotifySettingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotifySettingModelCopyWith<_NotifySettingModel> get copyWith => __$NotifySettingModelCopyWithImpl<_NotifySettingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotifySettingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotifySettingModel&&(identical(other.rebound, rebound) || other.rebound == rebound)&&(identical(other.hydrate, hydrate) || other.hydrate == hydrate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rebound,hydrate);

@override
String toString() {
  return 'NotifySettingModel(rebound: $rebound, hydrate: $hydrate)';
}


}

/// @nodoc
abstract mixin class _$NotifySettingModelCopyWith<$Res> implements $NotifySettingModelCopyWith<$Res> {
  factory _$NotifySettingModelCopyWith(_NotifySettingModel value, $Res Function(_NotifySettingModel) _then) = __$NotifySettingModelCopyWithImpl;
@override @useResult
$Res call({
 bool rebound, bool hydrate
});




}
/// @nodoc
class __$NotifySettingModelCopyWithImpl<$Res>
    implements _$NotifySettingModelCopyWith<$Res> {
  __$NotifySettingModelCopyWithImpl(this._self, this._then);

  final _NotifySettingModel _self;
  final $Res Function(_NotifySettingModel) _then;

/// Create a copy of NotifySettingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rebound = null,Object? hydrate = null,}) {
  return _then(_NotifySettingModel(
rebound: null == rebound ? _self.rebound : rebound // ignore: cast_nullable_to_non_nullable
as bool,hydrate: null == hydrate ? _self.hydrate : hydrate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
