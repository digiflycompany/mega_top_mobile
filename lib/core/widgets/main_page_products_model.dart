class MainPageProductsModel {
  final bool success;
  final List<Product>? products;
  final PaginationOptions? options;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  MainPageProductsModel({
    required this.success,
    this.products,
    this.options,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory MainPageProductsModel.fromJson(Map<String, dynamic> json) {
    return MainPageProductsModel(
      success: json['success'] ?? false,
      products: json['data'] != null && json['data']['products'] != null
          ? List<Product>.from(json['data']['products'].map((x) => Product.fromJson(x)))
          : null,
      options: json['data'] != null && json['data']['options'] != null
          ? PaginationOptions.fromJson(json['data']['options'])
          : null,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': {
        'products': products != null ? products!.map((x) => x.toJson()).toList() : null,
        'options': options?.toJson(),
      },
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
    };
  }
}

class Product {
  final String id;
  final String title;
  final String titleAr;
  final String description;
  final int quantity;
  final Category categoryId;
  final List<SubCategory> subcategoryId;
  final Price price;
  final String currency;
  final List<String>? images;
  final int unitsSold;
  final AddedBy addedBy;
  final bool active;
  final String createdAt;
  final String updatedAt;
  final int v;

  Product({
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
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      titleAr: json['titleAr'],
      description: json['description'],
      quantity: json['quantity'],
      categoryId: Category.fromJson(json['categoryId']),
      subcategoryId: List<SubCategory>.from(
          json['subcategoryId'].map((x) => SubCategory.fromJson(x))),
      price: Price.fromJson(json['price']),
      currency: json['currency'],
      images: List<String>.from(json['images'].map((x) => x)),
      unitsSold: json['unitsSold'],
      addedBy: AddedBy.fromJson(json['addedBy']),
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'titleAr': titleAr,
      'description': description,
      'quantity': quantity,
      'categoryId': categoryId.toJson(),
      'subcategoryId': subcategoryId.map((x) => x.toJson()).toList(),
      'price': price.toJson(),
      'currency': currency,
      'images': images,
      'unitsSold': unitsSold,
      'addedBy': addedBy.toJson(),
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class Category {
  final String id;
  final String name;
  final String nameAr;

  Category({
    required this.id,
    required this.name,
    required this.nameAr,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
    };
  }
}

class SubCategory {
  final String id;
  final String name;
  final String nameAr;

  SubCategory({
    required this.id,
    required this.name,
    required this.nameAr,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'],
      name: json['name'],
      nameAr: json['nameAr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'nameAr': nameAr,
    };
  }
}

class Price {
  final int originalPrice;
  final int finalPrice;

  Price({
    required this.originalPrice,
    required this.finalPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      originalPrice: json['originalPrice'],
      finalPrice: json['finalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalPrice': originalPrice,
      'finalPrice': finalPrice,
    };
  }
}

class AddedBy {
  final String id;
  final String fullName;
  final String email;

  AddedBy({
    required this.id,
    required this.fullName,
    required this.email,
  });

  factory AddedBy.fromJson(Map<String, dynamic> json) {
    return AddedBy(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
    };
  }
}

class PaginationOptions {
  final int limit;
  final int skip;
  final int page;
  final Map<String, dynamic> sort;

  PaginationOptions({
    required this.limit,
    required this.skip,
    required this.page,
    required this.sort,
  });

  factory PaginationOptions.fromJson(Map<String, dynamic> json) {
    return PaginationOptions(
      limit: json['limit'],
      skip: json['skip'],
      page: json['page'],
      sort: Map<String, dynamic>.from(json['sort']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'skip': skip,
      'page': page,
      'sort': sort,
    };
  }
}
