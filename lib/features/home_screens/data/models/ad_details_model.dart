import 'package:json_annotation/json_annotation.dart';

part 'ad_details_model.g.dart';

// Define the main AdDetailsModel class
@JsonSerializable()
class AdDetailsModel {
  final bool success;
  final AdDetailsData? data;

  AdDetailsModel({required this.success, this.data});

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AdDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdDetailsModelToJson(this);
}

// Define the nested AdDetailsData class
@JsonSerializable()
class AdDetailsData {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? titleAr;
  final String? description;
  final int? quantity;
  @JsonKey(name: 'categoryId')
  final Category? categoryId;
  @JsonKey(name: 'subcategoryId')
  final List<Subcategory>? subcategoryId;
  final Price? price;
  final String? currency;
  final List<String>? images;
  final int? unitsSold;
  @JsonKey(name: 'addedBy')
  final User? addedBy;
  final bool? active;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  final String? video;
  final bool? isInWishlist;

  AdDetailsData({
    this.id,
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
    this.video,
    this.isInWishlist,
  });

  factory AdDetailsData.fromJson(Map<String, dynamic> json) =>
      _$AdDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdDetailsDataToJson(this);
}

// Define the Category class
@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? nameAr;

  Category({this.id, this.name, this.nameAr});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

// Define the Subcategory class
@JsonSerializable()
class Subcategory {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? nameAr;

  Subcategory({this.id, this.name, this.nameAr});

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}

// Define the Price class
@JsonSerializable()
class Price {
  @JsonKey(name: 'originalPrice')
  final double? originalPrice;
  @JsonKey(name: 'finalPrice')
  final double? finalPrice;

  Price({this.originalPrice, this.finalPrice});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

// Define the User class (for addedBy)
@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String? id;
  final String? fullName;
  final String? email;

  User({this.id, this.fullName, this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
