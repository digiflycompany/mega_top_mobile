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
  final String? subtitle;
  final String? titleAr;
  final String? subtitleAr;
  final String? description;
  final String? descriptionAr;
  final Brand? brandId;
  final String? image;
  final bool? isSlider;
  final bool? isActive;
  @JsonKey(name: 'addedBy')
  final User? addedBy;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  final String? video;
  final Offer? offer;

  AdDetailsData(
      {this.id,
      this.title,
      this.subtitle,
      this.titleAr,
      this.subtitleAr,
      this.description,
      this.descriptionAr,
      this.brandId,
      this.image,
      this.isSlider,
      this.isActive,
      this.addedBy,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.video,
      this.offer});

  factory AdDetailsData.fromJson(Map<String, dynamic> json) =>
      _$AdDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdDetailsDataToJson(this);
}

// Define the Brand class
@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;

  Brand({this.id, this.name});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

// Define the User class
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

// Define the Offer class
@JsonSerializable()
class Offer {
  final String? offerType;
  final String? from;
  final String? to;

  Offer({this.offerType, this.from, this.to});

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
  Map<String, dynamic> toJson() => _$OfferToJson(this);
}