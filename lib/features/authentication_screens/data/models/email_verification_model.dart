// class EmailVerificationModel {
//   final bool success;
//   final String message;
//   final UserData? data;
//
//   EmailVerificationModel({
//     required this.success,
//     required this.message,
//     this.data,
//   });
//
//   factory EmailVerificationModel.fromJson(Map<String, dynamic> json) {
//     return EmailVerificationModel(
//       success: json['success'],
//       message: json['message'] ?? '',
//       data: json['data'] != null ? UserData.fromJson(json['data']) : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'message': message,
//       'data': data?.toJson(),
//     };
//   }
// }
//
// class UserData {
//   final String id;
//   final String fullName;
//   final String phoneNumber;
//   final String email;
//   final List<dynamic> wishlist;
//   final String role;
//   final bool isActive;
//   final bool isVerified;
//   final String createdAt;
//   final String updatedAt;
//
//   UserData({
//     required this.id,
//     required this.fullName,
//     required this.phoneNumber,
//     required this.email,
//     required this.wishlist,
//     required this.role,
//     required this.isActive,
//     required this.isVerified,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory UserData.fromJson(Map<String, dynamic> json) {
//     return UserData(
//       id: json['_id'],
//       fullName: json['fullName'],
//       phoneNumber: json['phoneNumber'],
//       email: json['email'],
//       wishlist: List<dynamic>.from(json['wishlist']),
//       role: json['role'],
//       isActive: json['isActive'],
//       isVerified: json['isVerified'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'fullName': fullName,
//       'phoneNumber': phoneNumber,
//       'email': email,
//       'wishlist': wishlist,
//       'role': role,
//       'isActive': isActive,
//       'isVerified': isVerified,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }
// }
