class CategoriesModel {
  bool? success;
  Data? data;

  CategoriesModel({this.success, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Categories>? categories;
  Options? options;

  Data({this.categories, this.options});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    options =
        json['options'] != null ? Options.fromJson(json['options']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? nameAr;
  String? description;
  String? status;
  AddedBy? addedBy;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Categories(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.status,
      this.addedBy,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    nameAr = json['nameAr'];
    description = json['description'];
    status = json['status'];
    addedBy =
        json['addedBy'] != null ? AddedBy.fromJson(json['addedBy']) : null;
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['nameAr'] = this.nameAr;
    data['description'] = this.description;
    data['status'] = this.status;
    if (this.addedBy != null) {
      data['addedBy'] = this.addedBy!.toJson();
    }
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class AddedBy {
  String? id;
  String? fullName;
  String? email;

  AddedBy({this.id, this.fullName, this.email});

  AddedBy.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.id;
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
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    return data;
  }
}
