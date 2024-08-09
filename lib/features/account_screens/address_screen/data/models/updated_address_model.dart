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
