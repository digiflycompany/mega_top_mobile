// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_addresses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressesModel _$UserAddressesModelFromJson(Map<String, dynamic> json) =>
    UserAddressesModel(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserAddressesModelToJson(UserAddressesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      cityId: json['cityId'] == null
          ? null
          : City.fromJson(json['cityId'] as Map<String, dynamic>),
      cityName: json['cityName'] as String?,
      firstLine: json['firstLine'] as String?,
      secondLine: json['secondLine'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'firstLine': instance.firstLine,
      'secondLine': instance.secondLine,
      'active': instance.active,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'nameAr': instance.nameAr,
    };
