/*
class UpdateAddressModel {
  final bool? success;
  final String? message;
  final int? statusCode;
  final int? errorCode;
  final Data? data;

  UpdateAddressModel({
    this.success,
    this.message,
    this.statusCode,
    this.errorCode,
    this.data,
  });

  factory UpdateAddressModel.fromJson(Map<String, dynamic> json) {
    return UpdateAddressModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      errorCode: json['errorCode'] as int?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final String? id;
  final String? userId;
  final String? name;
  final String? cityId;
  final String? cityName;
  final String? firstLine;
  final String? secondLine;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;
  final int? version;

  Data({
    this.id,
    this.userId,
    this.name,
    this.cityId,
    this.cityName,
    this.firstLine,
    this.secondLine,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
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
      version: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'name': name,
      'cityId': cityId,
      'cityName': cityName,
      'firstLine': firstLine,
      'secondLine': secondLine,
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
  }
}
*/

import 'package:json_annotation/json_annotation.dart';

part 'update_address_model.g.dart'; // This is where the generated code will be written

@JsonSerializable()
class UpdateAddressModel {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final AddressData? data;

  UpdateAddressModel({
    required this.success,
    this.data,
  });

  factory UpdateAddressModel.fromJson(Map<String, dynamic> json) => _$UpdateAddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateAddressModelToJson(this);
}

@JsonSerializable()
class AddressData {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'userId')
  final String? userId;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'cityId')
  final String? cityId;

  @JsonKey(name: 'cityName')
  final String? cityName;

  @JsonKey(name: 'firstLine')
  final String? firstLine;

  @JsonKey(name: 'secondLine')
  final String? secondLine;

  @JsonKey(name: 'active')
  final bool? active;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  @JsonKey(name: '__v')
  final int? v;

  AddressData({
    this.id,
    this.userId,
    this.name,
    this.cityId,
    this.cityName,
    this.firstLine,
    this.secondLine,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => _$AddressDataFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}