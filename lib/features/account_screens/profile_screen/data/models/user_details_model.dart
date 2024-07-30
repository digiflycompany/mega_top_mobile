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
  final int wishlistCount;
  final Map<String, int> unreadNotificationsCount;

  UserData({
    required this.user,
    required this.wishlistCount,
    required this.unreadNotificationsCount,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
      wishlistCount: json['wishlistCount'] ?? 0,
      unreadNotificationsCount: Map<String, int>.from(json['unreadNotificationsCount'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'wishlistCount': wishlistCount,
      'unreadNotificationsCount': unreadNotificationsCount,
    };
  }

  static UserData empty() {
    return UserData(
      user: User.empty(),
      wishlistCount: 0,
      unreadNotificationsCount: {},
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final List<WishlistItem> wishlist;
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
      wishlist: (json['wishlist'] as List).map((item) => WishlistItem.fromJson(item)).toList(),
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
      'wishlist': wishlist.map((item) => item.toJson()).toList(),
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

class WishlistItem {
  final String id;
  final String title;
  final String titleAr;
  final String description;
  final int quantity;
  final String categoryId;
  final List<String> subcategoryId;
  final Price price;
  final String currency;
  final List<String> images;
  final int unitsSold;
  final String addedBy;
  final bool active;
  final String createdAt;
  final String updatedAt;

  WishlistItem({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.description,
    required this.quantity,
    required this.categoryId,
    required this.subcategoryId,
    required this.price,
    required this.currency,
    required this.images,
    required this.unitsSold,
    required this.addedBy,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['_id'],
      title: json['title'],
      titleAr: json['titleAr'],
      description: json['description'],
      quantity: json['quantity'],
      categoryId: json['categoryId'],
      subcategoryId: List<String>.from(json['subcategoryId']),
      price: Price.fromJson(json['price']),
      currency: json['currency'],
      images: List<String>.from(json['images']),
      unitsSold: json['unitsSold'],
      addedBy: json['addedBy'],
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'titleAr': titleAr,
      'description': description,
      'quantity': quantity,
      'categoryId': categoryId,
      'subcategoryId': subcategoryId,
      'price': price.toJson(),
      'currency': currency,
      'images': images,
      'unitsSold': unitsSold,
      'addedBy': addedBy,
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class Price {
  final double originalPrice;
  final double finalPrice;

  Price({
    required this.originalPrice,
    required this.finalPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      originalPrice: json['originalPrice'].toDouble(),
      finalPrice: json['finalPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalPrice': originalPrice,
      'finalPrice': finalPrice,
    };
  }
}
