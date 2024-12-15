import 'package:json_annotation/json_annotation.dart';

part 'advertisement_model.g.dart';

// Main model class
@JsonSerializable()
class AdvertisementModel {
  final bool? success;
  final Data? data;

  AdvertisementModel({this.success, this.data});

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);
}

// Data class containing advertisements and options
@JsonSerializable()
class Data {
  final List<Advertisement>? advertisements;
  final Options? options;

  Data({this.advertisements, this.options});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

// Advertisement class representing each advertisement
@JsonSerializable()
class Advertisement {
  @JsonKey(name: '_id')
  final String? id;
  final String? image;
  @JsonKey(name: 'addedBy')
  final User? addedBy;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? titleAr;
  final String? subtitleAr;
  final String? descriptionAr;
  final Product? productId;
  @JsonKey(name: 'brandId')
  final Brand? brandId;
  final Category? categoryId;
  final SubCategory? subCategoryId;
  final bool? isSlider;
  final bool? isActive;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  Advertisement(
      {this.id,
      this.image,
      this.addedBy,
      this.title,
      this.subtitle,
      this.description,
      this.titleAr,
      this.subtitleAr,
      this.descriptionAr,
      this.productId,
      this.brandId,
      this.categoryId,
      this.subCategoryId,
      this.isSlider,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory Advertisement.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementFromJson(json);
  Map<String, dynamic> toJson() => _$AdvertisementToJson(this);
}

// User class for the advertisement's 'addedBy' field
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

// Brand class for the advertisement's 'brandId' field
@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;

  Brand({this.id, this.name});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

// Product class for the advertisement's 'productId' field (optional)
@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;

  Product({this.id, this.title});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? nameAr;

  Category({this.id, this.name, this.nameAr});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class SubCategory {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? nameAr; // Added 'nameAr' as per the data

  SubCategory({this.id, this.name, this.nameAr});

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}

// Options class containing pagination information
@JsonSerializable()
class Options {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;

  Options({this.limit, this.skip, this.sort, this.page});

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}

// Sort class for sorting information
@JsonSerializable()
class Sort {
  final String? order;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  Sort({this.order, this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
  Map<String, dynamic> toJson() => _$SortToJson(this);
}