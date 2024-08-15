class WishListModel {
  final bool? success;
  final WishListData? data;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  WishListModel({
    this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      success: json['success'],
      data: json['data'] != null ? WishListData.fromJson(json['data']) : null,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
    };
  }
}

class WishListData {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final List<String>? wishlist;
  final String? role;
  final bool? isActive;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  WishListData({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.wishlist,
    this.role,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory WishListData.fromJson(Map<String, dynamic> json) {
    return WishListData(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      wishlist: json['wishlist'] != null
          ? List<String>.from(json['wishlist'])
          : null,
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
