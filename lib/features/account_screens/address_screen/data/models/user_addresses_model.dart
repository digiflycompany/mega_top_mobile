/*
class UserAddressesModel {
  final bool success;
  final List<AddressData> data;
  final String message;
  final int statusCode;
  final int errorCode;

  UserAddressesModel({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errorCode,
  });

  factory UserAddressesModel.fromJson(Map<String, dynamic> json) {
    return UserAddressesModel(
      success: json['success'] ?? false,
      data: json['success'] == true
          ? (json['data'] as List).map((i) => AddressData.fromJson(i)).toList()
          : [],
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      errorCode: json['errorCode'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (success) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    } else {
      data['message'] = message;
      data['statusCode'] = statusCode;
      data['errorCode'] = errorCode;
    }
    return data;
  }
}

class AddressData {
  final String id;
  final String userId;
  final String name;
  final CityId cityId;
  final String cityName;
  final String firstLine;
  final String secondLine;
  final bool active;
  final String createdAt;
  final String updatedAt;
  final int v;

  AddressData({
    required this.id,
    required this.userId,
    required this.name,
    required this.cityId,
    required this.cityName,
    required this.firstLine,
    required this.secondLine,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      cityId: CityId.fromJson(json['cityId']),
      cityName: json['cityName'] ?? '',
      firstLine: json['firstLine'] ?? '',
      secondLine: json['secondLine'] ?? '',
      active: json['active'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['cityId'] = cityId.toJson();
    data['cityName'] = cityName;
    data['firstLine'] = firstLine;
    data['secondLine'] = secondLine;
    data['active'] = active;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class CityId {
  final String id;
  final String name;
  final String nameAr;

  CityId({
    required this.id,
    required this.name,
    required this.nameAr,
  });

  factory CityId.fromJson(Map<String, dynamic> json) {
    return CityId(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      nameAr: json['nameAr'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['nameAr'] = nameAr;
    return data;
  }
}
*/

import 'package:json_annotation/json_annotation.dart';

part 'user_addresses_model.g.dart';

// Root model
@JsonSerializable()
class UserAddressesModel {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final List<UserAddress>? data;

  UserAddressesModel({
    required this.success,
    this.data,
  });

  factory UserAddressesModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressesModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressesModelToJson(this);
}

// Address model
@JsonSerializable()
class UserAddress {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'userId')
  final String? userId;

  final String? name;

  @JsonKey(name: 'cityId')
  final City? cityId;

  final String? cityName;
  final String? firstLine;
  final String? secondLine;
  final bool? active;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  @JsonKey(name: '__v')
  final int? v;

  UserAddress({
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

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}

// City model
@JsonSerializable()
class City {
  @JsonKey(name: '_id')
  final String? id;

  final String? name;
  final String? nameAr;

  City({
    this.id,
    this.name,
    this.nameAr,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
