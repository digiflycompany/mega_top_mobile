// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertisementModel _$AdvertisementModelFromJson(Map<String, dynamic> json) =>
    AdvertisementModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdvertisementModelToJson(AdvertisementModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      advertisements: (json['advertisements'] as List<dynamic>?)
          ?.map((e) => Advertisement.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: json['options'] == null
          ? null
          : Options.fromJson(json['options'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'advertisements': instance.advertisements,
      'options': instance.options,
    };

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) =>
    Advertisement(
      id: json['_id'] as String?,
      image: json['image'] as String?,
      addedBy: json['addedBy'] == null
          ? null
          : User.fromJson(json['addedBy'] as Map<String, dynamic>),
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
      titleAr: json['titleAr'] as String?,
      subtitleAr: json['subtitleAr'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      productId: json['productId'] == null
          ? null
          : Product.fromJson(json['productId'] as Map<String, dynamic>),
      isSlider: json['isSlider'] as bool?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AdvertisementToJson(Advertisement instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'addedBy': instance.addedBy,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'titleAr': instance.titleAr,
      'subtitleAr': instance.subtitleAr,
      'descriptionAr': instance.descriptionAr,
      'productId': instance.productId,
      'isSlider': instance.isSlider,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
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

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      limit: (json['limit'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'limit': instance.limit,
      'skip': instance.skip,
      'sort': instance.sort,
      'page': instance.page,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
    };
