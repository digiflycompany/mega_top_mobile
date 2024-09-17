/*
class AdvertisementModel {
  final bool? success;
  final String? message;
  final int? statusCode;
  final int? errorCode;
  final Data? data;

  AdvertisementModel({
    this.success,
    this.message,
    this.statusCode,
    this.errorCode,
    this.data,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('success') && json['success'] == true) {
      return AdvertisementModel(
        success: json['success'],
        data: Data.fromJson(json['data']),
      );
    } else {
      return AdvertisementModel(
        message: json['message'],
        statusCode: json['statusCode'],
        errorCode: json['errorCode'],
      );
    }
  }
}

class Data {
  final List<Advertisement>? advertisements;
  final Options? options;

  Data({
    this.advertisements,
    this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      advertisements: (json['advertisements'] as List)
          .map((i) => Advertisement.fromJson(i))
          .toList(),
      options: Options.fromJson(json['options']),
    );
  }
}

class Advertisement {
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
  final String? createdAt;
  final String? updatedAt;
  final int? version;

  Advertisement({
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
    this.version,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['_id'],
      image: json['image'],
      addedBy: AddedBy.fromJson(json['addedBy']),
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      titleAr: json['titleAr'],
      subtitleAr: json['subtitleAr'],
      descriptionAr: json['descriptionAr'],
      productId: ProductId.fromJson(json['productId']),
      isSlider: json['isSlider'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
    );
  }
}

class AddedBy {
  final String? id;
  final String? fullName;
  final String? email;

  AddedBy({
    this.id,
    this.fullName,
    this.email,
  });

  factory AddedBy.fromJson(Map<String, dynamic> json) {
    return AddedBy(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }
}

class ProductId {
  final String? id;
  final String? title;

  ProductId({
    this.id,
    this.title,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) {
    return ProductId(
      id: json['_id'],
      title: json['title'],
    );
  }
}

class Options {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;

  Options({
    this.limit,
    this.skip,
    this.sort,
    this.page,
  });

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      limit: json['limit'],
      skip: json['skip'],
      sort: Sort.fromJson(json['sort']),
      page: json['page'],
    );
  }
}

class Sort {
  final String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }
}

*/

import 'package:json_annotation/json_annotation.dart';

part 'advertisement_model.g.dart';

// Main model class
@JsonSerializable()
class AdvertisementModel {
  final bool? success;
  final Data? data;

  AdvertisementModel({this.success, this.data});

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => _$AdvertisementModelFromJson(json);
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
  @JsonKey(name: 'productId')
  final Product? productId;
  final bool? isSlider;
  final bool? isActive;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  Advertisement({
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

  factory Advertisement.fromJson(Map<String, dynamic> json) => _$AdvertisementFromJson(json);
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

// Product class for the advertisement's 'productId' field
@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;

  Product({this.id, this.title});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

// Options class containing pagination information
@JsonSerializable()
class Options {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;

  Options({this.limit, this.skip, this.sort, this.page});

  factory Options.fromJson(Map<String, dynamic> json) => _$OptionsFromJson(json);
  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}

// Sort class for sorting information
@JsonSerializable()
class Sort {
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
  Map<String, dynamic> toJson() => _$SortToJson(this);
}