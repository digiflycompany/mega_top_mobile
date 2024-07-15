class UserModel {
  bool? success;
  String? message;
  int? errorCode;
  Data? data;

  UserModel({this.success, this.message, this.errorCode, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'] ?? 'An error occurred';
    errorCode = json['errorCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['errorCode'] = errorCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? phoneNumber;
  String? email;
  List<dynamic>? wishlist;
  String? role;
  bool? isActive;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.fullName,
        this.phoneNumber,
        this.email,
        this.wishlist,
        this.role,
        this.isActive,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    wishlist = json['wishlist'] != null ? List<dynamic>.from(json['wishlist']) : null;
    role = json['role'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    if (wishlist != null) {
      data['wishlist'] = wishlist!.map((v) => v).toList();
    }
    data['role'] = role;
    data['isActive'] = isActive;
    data['isVerified'] = isVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
