import '../../../../core/widgets/main_page_products_model.dart';

class UserCartModel {
  final bool success;
  final CartData? data;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  UserCartModel({
    required this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory UserCartModel.fromJson(Map<String, dynamic> json) {
    return UserCartModel(
      success: json['success'] ?? false,
      data: json['data'] != null ? CartData.fromJson(json['data']) : null,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['errorCode'] = errorCode;
    return data;
  }
}

class CartData {
  final String id;
  final String userId;
  final List<Product> products;
  final String createdAt;
  final String updatedAt;
  final int version;
  final double totalPrice;

  CartData({
    required this.id,
    required this.userId,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.totalPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['_id'],
      userId: json['userId'],
      products: (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = id;
    data['userId'] = userId;
    data['products'] = products.map((product) => product.toJson()).toList();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = version;
    data['totalPrice'] = totalPrice;
    return data;
  }
}

// class Product {
//   final String id;
//   final String title;
//   final String titleAr;
//   final Price price;
//   final List<String> images;
//   final int quantity;
//
//   Product({
//     required this.id,
//     required this.title,
//     required this.titleAr,
//     required this.price,
//     required this.images,
//     required this.quantity,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['_id'],
//       title: json['title'],
//       titleAr: json['titleAr'],
//       price: Price.fromJson(json['price']),
//       images: List<String>.from(json['images']),
//       quantity: json['quantity'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['_id'] = id;
//     data['title'] = title;
//     data['titleAr'] = titleAr;
//     data['price'] = price.toJson();
//     data['images'] = images;
//     data['quantity'] = quantity;
//     return data;
//   }
// }

class Price {
  final double originalPrice;
  final double finalPrice;

  Price({
    required this.originalPrice,
    required this.finalPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      originalPrice: (json['originalPrice'] as num).toDouble(),
      finalPrice: (json['finalPrice'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['originalPrice'] = originalPrice;
    data['finalPrice'] = finalPrice;
    return data;
  }
}
