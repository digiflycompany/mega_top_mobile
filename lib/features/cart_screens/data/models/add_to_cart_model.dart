class AddToCartModel {
  final bool success;
  final String? message;
  final int? statusCode;
  final int? errorCode;
  final CartData? data;

  AddToCartModel({
    required this.success,
    this.message,
    this.statusCode,
    this.errorCode,
    this.data,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      success: json['success'] ?? false,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
      data: json['data'] != null ? CartData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
      'data': data?.toJson(),
    };
  }
}

class CartData {
  final String id;
  final String userId;
  final List<Product> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  CartData({
    required this.id,
    required this.userId,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['_id'],
      userId: json['userId'],
      products: List<Product>.from(
        json['products'].map((product) => Product.fromJson(product)),
      ),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'products': products.map((product) => product.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class Product {
  final String id;
  final int quantity;

  Product({
    required this.id,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'quantity': quantity,
    };
  }
}

