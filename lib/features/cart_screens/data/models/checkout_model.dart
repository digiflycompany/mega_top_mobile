class CheckoutModel {
  final String? message;
  final int? statusCode;
  final int? errorCode;
  final bool? success;
  final CheckoutData? data;

  CheckoutModel({
    this.message,
    this.statusCode,
    this.errorCode,
    this.success,
    this.data,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
      success: json['success'],
      data: json['data'] != null ? CheckoutData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
      'success': success,
      'data': data?.toJson(),
    };
  }
}

class CheckoutData {
  final String? userId;
  final List<Product>? products;
  final String? companyName;
  final String? addedBy;
  final bool? completed;
  final ConsigneeInfo? consigneeInfo;
  final DropOffAddress? dropOffAddress;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  CheckoutData({
    this.userId,
    this.products,
    this.companyName,
    this.addedBy,
    this.completed,
    this.consigneeInfo,
    this.dropOffAddress,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CheckoutData.fromJson(Map<String, dynamic> json) {
    return CheckoutData(
      userId: json['userId'],
      products: json['products'] != null
          ? List<Product>.from(json['products'].map((x) => Product.fromJson(x)))
          : null,
      companyName: json['companyName'],
      addedBy: json['addedBy'],
      completed: json['completed'],
      consigneeInfo: json['consigneeInfo'] != null
          ? ConsigneeInfo.fromJson(json['consigneeInfo'])
          : null,
      dropOffAddress: json['dropOffAddress'] != null
          ? DropOffAddress.fromJson(json['dropOffAddress'])
          : null,
      id: json['_id'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'products': products?.map((x) => x.toJson()).toList(),
      'companyName': companyName,
      'addedBy': addedBy,
      'completed': completed,
      'consigneeInfo': consigneeInfo?.toJson(),
      'dropOffAddress': dropOffAddress?.toJson(),
      '_id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
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

  Product({
    this.id,
    this.title,
    this.titleAr,
    this.finalPrice,
    this.quantity,
    this.categoryName,
    this.categoryNameAr,
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
