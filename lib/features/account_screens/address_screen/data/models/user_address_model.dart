class UserAddressModel {
  final bool success;
  final AddressData data;
  final String message;
  final int statusCode;
  final int errorCode;

  UserAddressModel({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errorCode,
  });

  factory UserAddressModel.fromJson(Map<String, dynamic> json) {
    return UserAddressModel(
      success: json['success'] ?? false,
      data: json['success'] == true
          ? AddressData.fromJson(json['data'])
          : AddressData.empty(),
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      errorCode: json['errorCode'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (success) {
      data['data'] = this.data.toJson();
    } else {
      data['message'] = message;
      data['statusCode'] = statusCode;
      data['errorCode'] = errorCode;
    }
    return data;
  }
}

class AddressData {
  final String userId;
  final String name;
  final String cityId;
  final String cityName;
  final String firstLine;
  final String secondLine;
  final String googleMapsLink;
  final bool active;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int version;

  AddressData({
    required this.userId,
    required this.name,
    required this.cityId,
    required this.cityName,
    required this.firstLine,
    required this.secondLine,
    required this.googleMapsLink,
    required this.active,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      cityId: json['cityId'] ?? '',
      cityName: json['cityName'] ?? '',
      firstLine: json['firstLine'] ?? '',
      secondLine: json['secondLine'] ?? '',
      googleMapsLink: json['googleMapsLink'] ?? '',
      active: json['active'] ?? false,
      id: json['_id'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['name'] = name;
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    data['firstLine'] = firstLine;
    data['secondLine'] = secondLine;
    data['googleMapsLink'] = googleMapsLink;
    data['active'] = active;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = version;
    return data;
  }

  static AddressData empty() {
    return AddressData(
      userId: '',
      name: '',
      cityId: '',
      cityName: '',
      firstLine: '',
      secondLine: '',
      googleMapsLink: '',
      active: false,
      id: '',
      createdAt: '',
      updatedAt: '',
      version: 0,
    );
  }
}
