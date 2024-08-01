class RemoveFromWishListModel {
  final bool success;
  final UserData? data;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  RemoveFromWishListModel({
    required this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory RemoveFromWishListModel.fromJson(Map<String, dynamic> json) {
    return RemoveFromWishListModel(
      success: json['success'] ?? false,
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'success': success,
    };
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (message != null) {
      data['message'] = message;
    }
    if (statusCode != null) {
      data['statusCode'] = statusCode;
    }
    if (errorCode != null) {
      data['errorCode'] = errorCode;
    }
    return data;
  }
}

class UserData {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final List<String> wishlist;
  final String role;
  final bool isActive;
  final bool isVerified;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.wishlist,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      wishlist: List<String>.from(json['wishlist']),
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'wishlist': wishlist,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
