// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdDetailsModel _$AdDetailsModelFromJson(Map<String, dynamic> json) =>
    AdDetailsModel(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : AdDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdDetailsModelToJson(AdDetailsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

AdDetailsData _$AdDetailsDataFromJson(Map<String, dynamic> json) =>
    AdDetailsData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      titleAr: json['titleAr'] as String?,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      categoryId: json['categoryId'] == null
          ? null
          : Category.fromJson(json['categoryId'] as Map<String, dynamic>),
      subcategoryId: (json['subcategoryId'] as List<dynamic>?)
          ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      currency: json['currency'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      unitsSold: (json['unitsSold'] as num?)?.toInt(),
      addedBy: json['addedBy'] == null
          ? null
          : User.fromJson(json['addedBy'] as Map<String, dynamic>),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
      video: json['video'] as String?,
      isInWishlist: json['isInWishlist'] as bool?,
    );

Map<String, dynamic> _$AdDetailsDataToJson(AdDetailsData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'titleAr': instance.titleAr,
      'description': instance.description,
      'quantity': instance.quantity,
      'categoryId': instance.categoryId,
      'subcategoryId': instance.subcategoryId,
      'price': instance.price,
      'currency': instance.currency,
      'images': instance.images,
      'unitsSold': instance.unitsSold,
      'addedBy': instance.addedBy,
      'active': instance.active,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'video': instance.video,
      'isInWishlist': instance.isInWishlist,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'nameAr': instance.nameAr,
    };

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => Subcategory(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'nameAr': instance.nameAr,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      finalPrice: (json['finalPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'originalPrice': instance.originalPrice,
      'finalPrice': instance.finalPrice,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
    };
