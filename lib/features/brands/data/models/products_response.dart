class ProductsResponse {
  bool? success;
  Data? data;

  ProductsResponse({this.success, this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
        success: json['success'] as bool?,
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class Data {
  List<Product>? products;
  Options? options;

  Data({this.products, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        products: json['products'] != null
            ? (json['products'] as List)
                .map((product) => Product.fromJson(product))
                .toList()
            : null,
        options:
            json['options'] != null ? Options.fromJson(json['options']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((product) => product.toJson()).toList(),
      'options': options?.toJson()
    };
  }
}

class Product {
  String? id;
  String? title;
  String? titleAr;
  String? description;
  int? quantity;
  CategoryId? categoryId;
  List<SubcategoryId>? subcategoryId;
  Price? price;
  String? currency;
  List<String>? images;
  int? unitsSold;
  AddedBy? addedBy;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? video;

  Product(
      {this.id,
      this.title,
      this.titleAr,
      this.description,
      this.quantity,
      this.categoryId,
      this.subcategoryId,
      this.price,
      this.currency,
      this.images,
      this.unitsSold,
      this.addedBy,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.video});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        titleAr: json['titleAr'] as String?,
        description: json['description'] as String?,
        quantity: json['quantity'] as int?,
        categoryId: json['categoryId'] != null
            ? CategoryId.fromJson(json['categoryId'])
            : null,
        subcategoryId: json['subcategoryId'] != null
            ? (json['subcategoryId'] as List)
                .map((item) => SubcategoryId.fromJson(item))
                .toList()
            : null,
        price: json['price'] != null ? Price.fromJson(json['price']) : null,
        currency: json['currency'] as String?,
        images:
            json['images'] != null ? List<String>.from(json['images']) : null,
        unitsSold: json['unitsSold'] as int?,
        addedBy:
            json['addedBy'] != null ? AddedBy.fromJson(json['addedBy']) : null,
        active: json['active'] as bool?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?,
        video: json['video'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'titleAr': titleAr,
      'description': description,
      'quantity': quantity,
      'categoryId': categoryId?.toJson(),
      'subcategoryId': subcategoryId?.map((e) => e.toJson()).toList(),
      'price': price?.toJson(),
      'currency': currency,
      'images': images,
      'unitsSold': unitsSold,
      'addedBy': addedBy?.toJson(),
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'video': video
    };
  }
}

class CategoryId {
  String? id;
  String? name;
  String? nameAr;

  CategoryId({this.id, this.name, this.nameAr});

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        nameAr: json['nameAr'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'nameAr': nameAr};
  }
}

class SubcategoryId {
  String? id;
  String? name;
  String? nameAr;

  SubcategoryId({this.id, this.name, this.nameAr});

  factory SubcategoryId.fromJson(Map<String, dynamic> json) {
    return SubcategoryId(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        nameAr: json['nameAr'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'nameAr': nameAr};
  }
}

class Price {
  int? originalPrice;
  int? finalPrice;

  Price({this.originalPrice, this.finalPrice});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
        originalPrice: json['originalPrice'] as int?,
        finalPrice: json['finalPrice'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {'originalPrice': originalPrice, 'finalPrice': finalPrice};
  }
}

class AddedBy {
  String? id;
  String? fullName;
  String? email;

  AddedBy({this.id, this.fullName, this.email});

  factory AddedBy.fromJson(Map<String, dynamic> json) {
    return AddedBy(
        id: json['_id'] as String?,
        fullName: json['fullName'] as String?,
        email: json['email'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'fullName': fullName, 'email': email};
  }
}

class Options {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;

  Options({this.limit, this.skip, this.sort, this.page});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
        limit: json['limit'] as int?,
        skip: json['skip'] as int?,
        sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
        page: json['page'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {'limit': limit, 'skip': skip, 'sort': sort?.toJson(), 'page': page};
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'createdAt': createdAt};
  }
}