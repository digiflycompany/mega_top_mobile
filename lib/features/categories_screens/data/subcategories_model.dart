class SubCategoriesModel {
  SubCategoriesModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json){
    return SubCategoriesModel(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.subcategories,
    required this.options,
  });

  final List<Subcategory> subcategories;
  final Options? options;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      subcategories: json["subcategories"] == null ? [] : List<Subcategory>.from(json["subcategories"]!.map((x) => Subcategory.fromJson(x))),
      options: json["options"] == null ? null : Options.fromJson(json["options"]),
    );
  }

}

class Options {
  Options({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
  });

  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;

  factory Options.fromJson(Map<String, dynamic> json){
    return Options(
      limit: json["limit"],
      skip: json["skip"],
      sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
      page: json["page"],
    );
  }

}

class Sort {
  Sort({
    required this.createdAt,
  });

  final String? createdAt;

  factory Sort.fromJson(Map<String, dynamic> json){
    return Sort(
      createdAt: json["createdAt"],
    );
  }

}

class Subcategory {
  Subcategory({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.status,
    required this.addedBy,
    required this.categoryId,
    required this.subcategoryDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? name;
  final String? nameAr;
  final String? description;
  final String? status;
  final AddedBy? addedBy;
  final String? categoryId;
  final bool? subcategoryDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Subcategory.fromJson(Map<String, dynamic> json){
    return Subcategory(
      id: json["_id"],
      name: json["name"],
      nameAr: json["nameAr"],
      description: json["description"],
      status: json["status"],
      addedBy: json["addedBy"] == null ? null : AddedBy.fromJson(json["addedBy"]),
      categoryId: json["categoryId"],
      subcategoryDefault: json["default"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class AddedBy {
  AddedBy({
    required this.id,
    required this.fullName,
    required this.email,
  });

  final String? id;
  final String? fullName;
  final String? email;

  factory AddedBy.fromJson(Map<String, dynamic> json){
    return AddedBy(
      id: json["_id"],
      fullName: json["fullName"],
      email: json["email"],
    );
  }

}
