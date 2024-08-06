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
  final String cityId;
  final String firstLine;
  final String secondLine;
  final String googleMapsLink;
  final bool active;

  AddressData({
    required this.id,
    required this.userId,
    required this.name,
    required this.cityId,
    required this.firstLine,
    required this.secondLine,
    required this.googleMapsLink,
    required this.active,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      cityId: json['cityId'] ?? '',
      firstLine: json['firstLine'] ?? '',
      secondLine: json['secondLine'] ?? '',
      googleMapsLink: json['googleMapsLink'] ?? '',
      active: json['active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['cityId'] = cityId;
    data['firstLine'] = firstLine;
    data['secondLine'] = secondLine;
    data['googleMapsLink'] = googleMapsLink;
    data['active'] = active;
    return data;
  }
}
