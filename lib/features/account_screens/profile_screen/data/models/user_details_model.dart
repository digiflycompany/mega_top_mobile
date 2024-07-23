class UserDetailsModel {
  final bool success;
  final UserData data;
  final String message;
  final int statusCode;
  final int errorCode;

  UserDetailsModel({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errorCode,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      success: json['success'] ?? false,
      data: json['data'] != null ? UserData.fromJson(json['data']) : UserData.empty(),
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      errorCode: json['errorCode'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
    };
  }
}

class UserData {
  final User user;
  final int unreadNotificationsCount;

  UserData({
    required this.user,
    required this.unreadNotificationsCount,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
      unreadNotificationsCount: json['unreadNotificationsCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'unreadNotificationsCount': unreadNotificationsCount,
    };
  }

  static UserData empty() {
    return UserData(
      user: User.empty(),
      unreadNotificationsCount: 0,
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final List<dynamic> wishlist;
  final String role;
  final String createdAt;
  final String updatedAt;
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
      wishlist: json['wishlist'] ?? [],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isActive': isActive,
      'isVerified': isVerified,
    };
  }

  static User empty() {
    return User(
      id: '',
      fullName: '',
      phoneNumber: '',
      email: '',
      wishlist: [],
      role: '',
      createdAt: '',
      updatedAt: '',
      isActive: false,
      isVerified: false,
    );
  }
}
