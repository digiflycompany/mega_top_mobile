class OrdersModel {
  final bool? success;
  final List<OrderData>? data;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  OrdersModel({
    this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      success: json['success'],
      data: json['data'] != null
          ? List<OrderData>.from(json['data'].map((x) => OrderData.fromJson(x)))
          : null,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.map((x) => x.toJson()).toList(),
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
    };
  }
}

class OrderData {
  final String? id;
  final String? userId;
  final List<Product>? products;
  final String? addedBy;
  final bool? completed;
  final ConsigneeInfo? consigneeInfo;
  final DropOffAddress? dropOffAddress;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;

  OrderData({
    this.id,
    this.userId,
    this.products,
    this.addedBy,
    this.completed,
    this.consigneeInfo,
    this.dropOffAddress,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['_id'],
      userId: json['userId'],
      products: json['products'] != null
          ? List<Product>.from(json['products'].map((x) => Product.fromJson(x)))
          : null,
      addedBy: json['addedBy'],
      completed: json['completed'],
      consigneeInfo: json['consigneeInfo'] != null
          ? ConsigneeInfo.fromJson(json['consigneeInfo'])
          : null,
      dropOffAddress: json['dropOffAddress'] != null
          ? DropOffAddress.fromJson(json['dropOffAddress'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'products': products?.map((x) => x.toJson()).toList(),
      'addedBy': addedBy,
      'completed': completed,
      'consigneeInfo': consigneeInfo?.toJson(),
      'dropOffAddress': dropOffAddress?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': version,
    };
  }
}

class Product {
  final String? id;
  final String? title;
  final String? titleAr;
  final int? finalPrice;
  final int? quantity;
  final String? categoryName;
  final String? categoryNameAr;
  final String? image;

  Product({
    this.id,
    this.title,
    this.titleAr,
    this.finalPrice,
    this.quantity,
    this.categoryName,
    this.categoryNameAr,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      titleAr: json['titleAr'],
      finalPrice: json['finalPrice'],
      quantity: json['quantity'],
      categoryName: json['categoryName'],
      categoryNameAr: json['categoryNameAr'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'titleAr': titleAr,
      'finalPrice': finalPrice,
      'quantity': quantity,
      'categoryName': categoryName,
      'categoryNameAr': categoryNameAr,
      'image': image,
    };
  }
}

class ConsigneeInfo {
  final String? name;
  final String? phoneNumber;
  final String? email;

  ConsigneeInfo({
    this.name,
    this.phoneNumber,
    this.email,
  });

  factory ConsigneeInfo.fromJson(Map<String, dynamic> json) {
    return ConsigneeInfo(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}

class DropOffAddress {
  final String? name;
  final String? id;
  final String? cityId;
  final String? cityName;
  final String? firstLine;
  final String? secondLine;

  DropOffAddress({
    this.name,
    this.id,
    this.cityId,
    this.cityName,
    this.firstLine,
    this.secondLine,
  });

  factory DropOffAddress.fromJson(Map<String, dynamic> json) {
    return DropOffAddress(
      name: json['name'],
      id: json['_id'],
      cityId: json['cityId'],
      cityName: json['cityName'],
      firstLine: json['firstLine'],
      secondLine: json['secondLine'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      '_id': id,
      'cityId': cityId,
      'cityName': cityName,
      'firstLine': firstLine,
      'secondLine': secondLine,
    };
  }
}
