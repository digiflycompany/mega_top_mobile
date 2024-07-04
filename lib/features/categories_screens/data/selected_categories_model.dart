class SelectedCategoryModel {
  bool? success;
  Data? data;

  SelectedCategoryModel({this.success, this.data});

  SelectedCategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;
  Options? options;

  Data({this.products, this.options});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    options =
        json['options'] != null ? new Options.fromJson(json['options']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    return data;
  }
}

class Products {
  String? sId;
  String? title;
  String? titleAr;
  String? description;
  int? quantity;
  CategoryId? categoryId;
  Price? price;
  String? currency;
  List<String>? images;
  int? unitsSold;
  AddedBy? addedBy;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Products({
    this.sId,
    this.title,
    this.titleAr,
    this.description,
    this.quantity,
    this.categoryId,
    this.price,
    this.currency,
    this.images,
    this.unitsSold,
    this.addedBy,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    titleAr = json['titleAr'];
    description = json['description'];
    quantity = json['quantity'];
    categoryId = json['categoryId'] != null
        ? new CategoryId.fromJson(json['categoryId'])
        : null;
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    currency = json['currency'];
    images = json['images'].cast<String>();
    unitsSold = json['unitsSold'];
    addedBy =
        json['addedBy'] != null ? new AddedBy.fromJson(json['addedBy']) : null;
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['titleAr'] = this.titleAr;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    if (this.categoryId != null) {
      data['categoryId'] = this.categoryId!.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['currency'] = this.currency;
    data['images'] = this.images;
    data['unitsSold'] = this.unitsSold;
    if (this.addedBy != null) {
      data['addedBy'] = this.addedBy!.toJson();
    }
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class CategoryId {
  String? sId;
  String? name;
  String? nameAr;

  CategoryId({this.sId, this.name, this.nameAr});

  CategoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['nameAr'] = this.nameAr;
    return data;
  }
}

class Price {
  int? originalPrice;
  int? finalPrice;

  Price({this.originalPrice, this.finalPrice});

  Price.fromJson(Map<String, dynamic> json) {
    originalPrice = json['originalPrice'];
    finalPrice = json['finalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['originalPrice'] = this.originalPrice;
    data['finalPrice'] = this.finalPrice;
    return data;
  }
}

class AddedBy {
  String? sId;
  String? fullName;
  String? email;

  AddedBy({this.sId, this.fullName, this.email});

  AddedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    return data;
  }
}

class Options {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;

  Options({this.limit, this.skip, this.sort, this.page});

  Options.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    skip = json['skip'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['skip'] = this.skip;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['page'] = this.page;
    return data;
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  Sort.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    return data;
  }
}
