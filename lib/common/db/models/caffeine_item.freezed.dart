// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'caffeine_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CaffeineItemModel {

 int get id; String get name; String? get brand; String get serviceSize; double get caffeineAmount; bool get isCustom; int get hits;
/// Create a copy of CaffeineItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaffeineItemModelCopyWith<CaffeineItemModel> get copyWith => _$CaffeineItemModelCopyWithImpl<CaffeineItemModel>(this as CaffeineItemModel, _$identity);

  /// Serializes this CaffeineItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaffeineItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.serviceSize, serviceSize) || other.serviceSize == serviceSize)&&(identical(other.caffeineAmount, caffeineAmount) || other.caffeineAmount == caffeineAmount)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.hits, hits) || other.hits == hits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,brand,serviceSize,caffeineAmount,isCustom,hits);

@override
String toString() {
  return 'CaffeineItemModel(id: $id, name: $name, brand: $brand, serviceSize: $serviceSize, caffeineAmount: $caffeineAmount, isCustom: $isCustom, hits: $hits)';
}


}

/// @nodoc
abstract mixin class $CaffeineItemModelCopyWith<$Res>  {
  factory $CaffeineItemModelCopyWith(CaffeineItemModel value, $Res Function(CaffeineItemModel) _then) = _$CaffeineItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? brand, String serviceSize, double caffeineAmount, bool isCustom, int hits
});




}
/// @nodoc
class _$CaffeineItemModelCopyWithImpl<$Res>
    implements $CaffeineItemModelCopyWith<$Res> {
  _$CaffeineItemModelCopyWithImpl(this._self, this._then);

  final CaffeineItemModel _self;
  final $Res Function(CaffeineItemModel) _then;

/// Create a copy of CaffeineItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? brand = freezed,Object? serviceSize = null,Object? caffeineAmount = null,Object? isCustom = null,Object? hits = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,serviceSize: null == serviceSize ? _self.serviceSize : serviceSize // ignore: cast_nullable_to_non_nullable
as String,caffeineAmount: null == caffeineAmount ? _self.caffeineAmount : caffeineAmount // ignore: cast_nullable_to_non_nullable
as double,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,hits: null == hits ? _self.hits : hits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CaffeineItemModel].
extension CaffeineItemModelPatterns on CaffeineItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaffeineItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaffeineItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaffeineItemModel value)  $default,){
final _that = this;
switch (_that) {
case _CaffeineItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaffeineItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _CaffeineItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? brand,  String serviceSize,  double caffeineAmount,  bool isCustom,  int hits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaffeineItemModel() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.serviceSize,_that.caffeineAmount,_that.isCustom,_that.hits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? brand,  String serviceSize,  double caffeineAmount,  bool isCustom,  int hits)  $default,) {final _that = this;
switch (_that) {
case _CaffeineItemModel():
return $default(_that.id,_that.name,_that.brand,_that.serviceSize,_that.caffeineAmount,_that.isCustom,_that.hits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? brand,  String serviceSize,  double caffeineAmount,  bool isCustom,  int hits)?  $default,) {final _that = this;
switch (_that) {
case _CaffeineItemModel() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.serviceSize,_that.caffeineAmount,_that.isCustom,_that.hits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaffeineItemModel implements CaffeineItemModel {
  const _CaffeineItemModel({required this.id, required this.name, this.brand, required this.serviceSize, required this.caffeineAmount, required this.isCustom, required this.hits});
  factory _CaffeineItemModel.fromJson(Map<String, dynamic> json) => _$CaffeineItemModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? brand;
@override final  String serviceSize;
@override final  double caffeineAmount;
@override final  bool isCustom;
@override final  int hits;

/// Create a copy of CaffeineItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaffeineItemModelCopyWith<_CaffeineItemModel> get copyWith => __$CaffeineItemModelCopyWithImpl<_CaffeineItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaffeineItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaffeineItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.serviceSize, serviceSize) || other.serviceSize == serviceSize)&&(identical(other.caffeineAmount, caffeineAmount) || other.caffeineAmount == caffeineAmount)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.hits, hits) || other.hits == hits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,brand,serviceSize,caffeineAmount,isCustom,hits);

@override
String toString() {
  return 'CaffeineItemModel(id: $id, name: $name, brand: $brand, serviceSize: $serviceSize, caffeineAmount: $caffeineAmount, isCustom: $isCustom, hits: $hits)';
}


}

/// @nodoc
abstract mixin class _$CaffeineItemModelCopyWith<$Res> implements $CaffeineItemModelCopyWith<$Res> {
  factory _$CaffeineItemModelCopyWith(_CaffeineItemModel value, $Res Function(_CaffeineItemModel) _then) = __$CaffeineItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? brand, String serviceSize, double caffeineAmount, bool isCustom, int hits
});




}
/// @nodoc
class __$CaffeineItemModelCopyWithImpl<$Res>
    implements _$CaffeineItemModelCopyWith<$Res> {
  __$CaffeineItemModelCopyWithImpl(this._self, this._then);

  final _CaffeineItemModel _self;
  final $Res Function(_CaffeineItemModel) _then;

/// Create a copy of CaffeineItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? brand = freezed,Object? serviceSize = null,Object? caffeineAmount = null,Object? isCustom = null,Object? hits = null,}) {
  return _then(_CaffeineItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,serviceSize: null == serviceSize ? _self.serviceSize : serviceSize // ignore: cast_nullable_to_non_nullable
as String,caffeineAmount: null == caffeineAmount ? _self.caffeineAmount : caffeineAmount // ignore: cast_nullable_to_non_nullable
as double,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,hits: null == hits ? _self.hits : hits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
