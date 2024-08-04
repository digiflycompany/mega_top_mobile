import 'package:intl/intl.dart';

class NotificationModel {
  final bool? success;
  final List<Notification>? notifications;
  final Options? options;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  NotificationModel({
    this.success,
    this.notifications,
    this.options,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      success: json['success'],
      notifications: json['data'] != null && json['data']['notifications'] != null
          ? List<Notification>.from(json['data']['notifications'].map((x) => Notification.fromJson(x)))
          : null,
      options: json['data'] != null && json['data']['options'] != null
          ? Options.fromJson(json['data']['options'])
          : null,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) data['success'] = this.success;
    if (this.notifications != null)
      data['data'] = {'notifications': this.notifications!.map((x) => x.toJson()).toList()};
    if (this.options != null) data['data']['options'] = this.options!.toJson();
    if (this.message != null) data['message'] = this.message;
    if (this.statusCode != null) data['statusCode'] = this.statusCode;
    if (this.errorCode != null) data['errorCode'] = this.errorCode;
    return data;
  }
}

class Notification {
  final String id;
  final List<Target> targets;
  final String contentType;
  final AdId adId;
  final String sender;
  final String createdAt;
  final String updatedAt;

  Notification({
    required this.id,
    required this.targets,
    required this.contentType,
    required this.adId,
    required this.sender,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['_id'],
      targets: List<Target>.from(json['targets'].map((x) => Target.fromJson(x))),
      contentType: json['contentType'],
      adId: AdId.fromJson(json['adId']),
      sender: json['sender'],
      createdAt: formatDateOnly(json['createdAt']),
      updatedAt: formatDateOnly(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['targets'] = this.targets.map((x) => x.toJson()).toList();
    data['contentType'] = this.contentType;
    data['adId'] = this.adId.toJson();
    data['sender'] = this.sender;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Target {
  final String userId;
  final bool read;

  Target({
    required this.userId,
    required this.read,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      userId: json['userId'],
      read: json['read'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['read'] = this.read;
    return data;
  }
}

class AdId {
  final String id;
  final String image;
  final String addedBy;
  final String title;
  final String subtitle;
  final String description;
  final String productId;
  final bool isSlider;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String? descriptionAr;
  final String? subtitleAr;
  final String? titleAr;

  AdId({
    required this.id,
    required this.image,
    required this.addedBy,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.productId,
    required this.isSlider,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.descriptionAr,
    this.subtitleAr,
    this.titleAr,
  });

  factory AdId.fromJson(Map<String, dynamic> json) {
    return AdId(
      id: json['_id'],
      image: json['image'],
      addedBy: json['addedBy'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      productId: json['productId'],
      isSlider: json['isSlider'],
      isActive: json['isActive'],
      createdAt: formatDateOnly(json['createdAt']),
      updatedAt: formatDateOnly(json['updatedAt']),
      descriptionAr: json['descriptionAr'],
      subtitleAr: json['subtitleAr'],
      titleAr: json['titleAr'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['image'] = this.image;
    data['addedBy'] = this.addedBy;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['productId'] = this.productId;
    data['isSlider'] = this.isSlider;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.descriptionAr != null) data['descriptionAr'] = this.descriptionAr;
    if (this.subtitleAr != null) data['subtitleAr'] = this.subtitleAr;
    if (this.titleAr != null) data['titleAr'] = this.titleAr;
    return data;
  }
}

class Options {
  final int limit;
  final int skip;
  final Sort sort;
  final int page;

  Options({
    required this.limit,
    required this.skip,
    required this.sort,
    required this.page,
  });

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      limit: json['limit'],
      skip: json['skip'],
      sort: Sort.fromJson(json['sort']),
      page: json['page'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['skip'] = this.skip;
    data['sort'] = this.sort.toJson();
    data['page'] = this.page;
    return data;
  }
}

class Sort {
  final String createdAt;

  Sort({
    required this.createdAt,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    return data;
  }
}

String formatDateOnly(String dateTime) {
  DateTime parsedDate = DateTime.parse(dateTime);
  DateFormat formatter = DateFormat('yyyy-MM-dd'); // You can adjust the format as needed
  return formatter.format(parsedDate);
}
