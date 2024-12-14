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
      subtitle: json['subtitle'] as String?,
      titleAr: json['titleAr'] as String?,
      subtitleAr: json['subtitleAr'] as String?,
      description: json['description'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      brandId: json['brandId'] == null
          ? null
          : Brand.fromJson(json['brandId'] as Map<String, dynamic>),
      image: json['image'] as String?,
      isSlider: json['isSlider'] as bool?,
      isActive: json['isActive'] as bool?,
      addedBy: json['addedBy'] == null
          ? null
          : User.fromJson(json['addedBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
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
      'subtitle': instance.subtitle,
      'titleAr': instance.titleAr,
      'subtitleAr': instance.subtitleAr,
      'description': instance.description,
      'descriptionAr': instance.descriptionAr,
      'brandId': instance.brandId,
      'image': instance.image,
      'isSlider': instance.isSlider,
      'isActive': instance.isActive,
      'addedBy': instance.addedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'video': instance.video,
      'offer': instance.offer,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
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

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      offerType: json['offerType'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'offerType': instance.offerType,
      'from': instance.from,
      'to': instance.to,
    };
