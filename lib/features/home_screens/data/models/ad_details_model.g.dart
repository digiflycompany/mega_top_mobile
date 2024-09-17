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
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      currency: json['currency'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      specifications: (json['specifications'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      unitsSold: (json['unitsSold'] as num?)?.toInt(),
      addedBy: json['addedBy'] == null
          ? null
          : AddedBy.fromJson(json['addedBy'] as Map<String, dynamic>),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
      video: json['video'] as String?,
      offer: json['offer'] == null
          ? null
          : Offer.fromJson(json['offer'] as Map<String, dynamic>),
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
      'specifications': instance.specifications,
      'unitsSold': instance.unitsSold,
      'addedBy': instance.addedBy,
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'video': instance.video,
      'offer': instance.offer,
    };

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      offerType: json['offerType'] as String?,
      from:
          json['from'] == null ? null : DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'offerType': instance.offerType,
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
    };
