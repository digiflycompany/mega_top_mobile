import 'dart:convert';

class UpdateProfileModel {
  final bool? success;
  final User? data;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  UpdateProfileModel({
    this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      success: json['success'],
      data: json['data'] != null ? User.fromJson(json['data']['updatedUser']) : null,
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

class User {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final List<dynamic> wishlist;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;
  final bool isVerified;

  User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.wishlist,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      wishlist: List<dynamic>.from(json['wishlist']),
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isActive: json['isActive'],
      isVerified: json['isVerified'],
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
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isActive': isActive,
      'isVerified': isVerified,
    };
  }
}

void main() {
  // Example JSON responses
  const successJson = '''
  {
    "success": true,
    "data": {
        "updatedUser": {
            "_id": "9aVKqgnDWS",
            "fullName": "zzzzzz zzzzzzz",
            "phoneNumber": "+2412312",
            "email": "testt@digiflyz.com",
            "wishlist": [],
            "role": "SUPER_ADMIN",
            "createdAt": "2024-06-21T23:00:19.827Z",
            "updatedAt": "2024-07-22T08:23:00.813Z",
            "isActive": true,
            "isVerified": true
        }
    }
  }''';

  const errorJson = '''
  {
    "message": "User not authorized",
    "statusCode": 401,
    "errorCode": 1
  }''';

  // Parse the success JSON
  final successModel = UpdateProfileModel.fromJson(jsonDecode(successJson));
  print('Success Model: ${successModel.toJson()}');

  // Parse the error JSON
  final errorModel = UpdateProfileModel.fromJson(jsonDecode(errorJson));
  print('Error Model: ${errorModel.toJson()}');
}
