import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';

class OfferModel {
  OfferModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory OfferModel.fromJson(Map<String, dynamic> json){
    return OfferModel(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.products,
    required this.options,
  });

  final List<Product> products;
  final Options? options;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
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

// class Product {
//   Product({
//     required this.id,
//     required this.title,
//     required this.titleAr,
//     required this.description,
//     required this.quantity,
//     required this.categoryId,
//     required this.subcategoryId,
//     required this.price,
//     required this.currency,
//     required this.images,
//     required this.unitsSold,
//     required this.addedBy,
//     required this.active,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });
//
//   final String? id;
//   final String? title;
//   final String? titleAr;
//   final String? description;
//   final int? quantity;
//   final CategoryId? categoryId;
//   final List<CategoryId> subcategoryId;
//   final Price? price;
//   final String? currency;
//   final List<String> images;
//   final int? unitsSold;
//   final AddedBy? addedBy;
//   final bool? active;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? v;
//
//   factory Product.fromJson(Map<String, dynamic> json){
//     return Product(
//       id: json["_id"],
//       title: json["title"],
//       titleAr: json["titleAr"],
//       description: json["description"],
//       quantity: json["quantity"],
//       categoryId: json["categoryId"] == null ? null : CategoryId.fromJson(json["categoryId"]),
//       subcategoryId: json["subcategoryId"] == null ? [] : List<CategoryId>.from(json["subcategoryId"]!.map((x) => CategoryId.fromJson(x))),
//       price: json["price"] == null ? null : Price.fromJson(json["price"]),
//       currency: json["currency"],
//       images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
//       unitsSold: json["unitsSold"],
//       addedBy: json["addedBy"] == null ? null : AddedBy.fromJson(json["addedBy"]),
//       active: json["active"],
//       createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
//       updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
//       v: json["__v"],
//     );
//   }
//
// }

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

class CategoryId {
  CategoryId({
    required this.id,
    required this.name,
    required this.nameAr,
  });

  final String? id;
  final String? name;
  final String? nameAr;

  factory CategoryId.fromJson(Map<String, dynamic> json){
    return CategoryId(
      id: json["_id"],
      name: json["name"],
      nameAr: json["nameAr"],
    );
  }

}

class Price {
  Price({
    required this.originalPrice,
    required this.finalPrice,
  });

  final int? originalPrice;
  final int? finalPrice;

  factory Price.fromJson(Map<String, dynamic> json){
    return Price(
      originalPrice: json["originalPrice"],
      finalPrice: json["finalPrice"],
    );
  }

}
