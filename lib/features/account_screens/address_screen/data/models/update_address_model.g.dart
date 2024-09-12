// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAddressModel _$UpdateAddressModelFromJson(Map<String, dynamic> json) =>
    UpdateAddressModel(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : AddressData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateAddressModelToJson(UpdateAddressModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      cityId: json['cityId'] as String?,
      cityName: json['cityName'] as String?,
      firstLine: json['firstLine'] as String?,
      secondLine: json['secondLine'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
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
