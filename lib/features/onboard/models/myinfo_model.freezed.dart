// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myinfo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyInfoModel {

 Gender get gender; double get weight; int get age; bool get smoking;
/// Create a copy of MyInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyInfoModelCopyWith<MyInfoModel> get copyWith => _$MyInfoModelCopyWithImpl<MyInfoModel>(this as MyInfoModel, _$identity);

  /// Serializes this MyInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyInfoModel&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.age, age) || other.age == age)&&(identical(other.smoking, smoking) || other.smoking == smoking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gender,weight,age,smoking);

@override
String toString() {
  return 'MyInfoModel(gender: $gender, weight: $weight, age: $age, smoking: $smoking)';
}


}

/// @nodoc
abstract mixin class $MyInfoModelCopyWith<$Res>  {
  factory $MyInfoModelCopyWith(MyInfoModel value, $Res Function(MyInfoModel) _then) = _$MyInfoModelCopyWithImpl;
@useResult
$Res call({
 Gender gender, double weight, int age, bool smoking
});




}
/// @nodoc
class _$MyInfoModelCopyWithImpl<$Res>
    implements $MyInfoModelCopyWith<$Res> {
  _$MyInfoModelCopyWithImpl(this._self, this._then);

  final MyInfoModel _self;
  final $Res Function(MyInfoModel) _then;

/// Create a copy of MyInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gender = null,Object? weight = null,Object? age = null,Object? smoking = null,}) {
  return _then(_self.copyWith(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,smoking: null == smoking ? _self.smoking : smoking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MyInfoModel].
extension MyInfoModelPatterns on MyInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _MyInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Gender gender,  double weight,  int age,  bool smoking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyInfoModel() when $default != null:
return $default(_that.gender,_that.weight,_that.age,_that.smoking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Gender gender,  double weight,  int age,  bool smoking)  $default,) {final _that = this;
switch (_that) {
case _MyInfoModel():
return $default(_that.gender,_that.weight,_that.age,_that.smoking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Gender gender,  double weight,  int age,  bool smoking)?  $default,) {final _that = this;
switch (_that) {
case _MyInfoModel() when $default != null:
return $default(_that.gender,_that.weight,_that.age,_that.smoking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyInfoModel implements MyInfoModel {
  const _MyInfoModel({required this.gender, required this.weight, required this.age, required this.smoking});
  factory _MyInfoModel.fromJson(Map<String, dynamic> json) => _$MyInfoModelFromJson(json);

@override final  Gender gender;
@override final  double weight;
@override final  int age;
@override final  bool smoking;

/// Create a copy of MyInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyInfoModelCopyWith<_MyInfoModel> get copyWith => __$MyInfoModelCopyWithImpl<_MyInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyInfoModel&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.age, age) || other.age == age)&&(identical(other.smoking, smoking) || other.smoking == smoking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gender,weight,age,smoking);

@override
String toString() {
  return 'MyInfoModel(gender: $gender, weight: $weight, age: $age, smoking: $smoking)';
}


}

/// @nodoc
abstract mixin class _$MyInfoModelCopyWith<$Res> implements $MyInfoModelCopyWith<$Res> {
  factory _$MyInfoModelCopyWith(_MyInfoModel value, $Res Function(_MyInfoModel) _then) = __$MyInfoModelCopyWithImpl;
@override @useResult
$Res call({
 Gender gender, double weight, int age, bool smoking
});




}
/// @nodoc
class __$MyInfoModelCopyWithImpl<$Res>
    implements _$MyInfoModelCopyWith<$Res> {
  __$MyInfoModelCopyWithImpl(this._self, this._then);

  final _MyInfoModel _self;
  final $Res Function(_MyInfoModel) _then;

/// Create a copy of MyInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gender = null,Object? weight = null,Object? age = null,Object? smoking = null,}) {
  return _then(_MyInfoModel(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,smoking: null == smoking ? _self.smoking : smoking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
