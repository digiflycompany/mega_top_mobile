/*
import 'package:json_annotation/json_annotation.dart';

part 'ad_details_model.g.dart';

@JsonSerializable()
class AdDetailsModel {
  final bool success;
  final AdDetailsData? data;

  AdDetailsModel({required this.success, this.data});

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) => _$AdDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdDetailsModelToJson(this);
}

@JsonSerializable()
class AdDetailsData {
  @JsonKey(name: '_id')
  final String? id;
  final String? image;
  final AddedBy? addedBy;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? titleAr;
  final String? subtitleAr;
  final String? descriptionAr;
  final ProductId? productId;
  final bool? isSlider;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  AdDetailsData({
    this.id,
    this.image,
    this.addedBy,
    this.title,
    this.subtitle,
    this.description,
    this.titleAr,
    this.subtitleAr,
    this.descriptionAr,
    this.productId,
    this.isSlider,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AdDetailsData.fromJson(Map<String, dynamic> json) => _$AdDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdDetailsDataToJson(this);
}

@JsonSerializable()
class AddedBy {
  @JsonKey(name: '_id')
  final String? id;
  final String? fullName;
  final String? email;

  AddedBy({this.id, this.fullName, this.email});

  factory AddedBy.fromJson(Map<String, dynamic> json) => _$AddedByFromJson(json);
  Map<String, dynamic> toJson() => _$AddedByToJson(this);
}

@JsonSerializable()
class ProductId {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;

  ProductId({this.id, this.title});

  factory ProductId.fromJson(Map<String, dynamic> json) => _$ProductIdFromJson(json);
  Map<String, dynamic> toJson() => _$ProductIdToJson(this);
}*/


import 'package:json_annotation/json_annotation.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';

part 'ad_details_model.g.dart';

// Define the main AdDetailsModel class
@JsonSerializable()
class AdDetailsModel {
  final bool success;
  final AdDetailsData? data;

  AdDetailsModel({required this.success, this.data});

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) => _$AdDetailsModelFromJson(json);
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
  final Category? categoryId;
  final List<SubCategory>? subcategoryId;
  final Price? price;
  final String? currency;
  final List<String>? images;
  final Map<String, String>? specifications;
  final int? unitsSold;
  final AddedBy? addedBy;
  final bool? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  final String? video;
  final Offer? offer;

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
    this.specifications,
    this.unitsSold,
    this.addedBy,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.video,
    this.offer,
  });

  factory AdDetailsData.fromJson(Map<String, dynamic> json) => _$AdDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdDetailsDataToJson(this);
}

// Define the Offer class
@JsonSerializable()
class Offer {
  final String? offerType;
  final DateTime? from;
  final DateTime? to;

  Offer({this.offerType, this.from, this.to});

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
  Map<String, dynamic> toJson() => _$OfferToJson(this);
}