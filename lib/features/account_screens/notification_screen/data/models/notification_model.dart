class NotificationModel {
  final bool success;
  final NotificationData? data;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  NotificationModel({
    required this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      success: json['success'] ?? false,
      data: json.containsKey('data') ? NotificationData.fromJson(json['data']) : null,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
    };
  }
}

class NotificationData {
  final List<Notification> notifications;
  final Options options;

  NotificationData({
    required this.notifications,
    required this.options,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      notifications: (json['notifications'] as List)
          .map((notification) => Notification.fromJson(notification))
          .toList(),
      options: Options.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notifications': notifications.map((notification) => notification.toJson()).toList(),
      'options': options.toJson(),
    };
  }
}

class Notification {
  final String id;
  final List<Target> targets;
  final String contentType;
  final Ad ad;
  final String sender;
  final String createdAt;
  final String updatedAt;
  final int version;

  Notification({
    required this.id,
    required this.targets,
    required this.contentType,
    required this.ad,
    required this.sender,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['_id'],
      targets: (json['targets'] as List).map((target) => Target.fromJson(target)).toList(),
      contentType: json['contentType'],
      ad: Ad.fromJson(json['adId']),
      sender: json['sender'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'targets': targets.map((target) => target.toJson()).toList(),
      'contentType': contentType,
      'adId': ad.toJson(),
      'sender': sender,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
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
    return {
      'userId': userId,
      'read': read,
    };
  }
}

class Ad {
  final String id;
  final String image;
  final String addedBy;
  final String title;
  final String subtitle;
  final String description;
  final String titleAr;
  final String subtitleAr;
  final String descriptionAr;
  final String productId;
  final bool isSlider;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final int version;

  Ad({
    required this.id,
    required this.image,
    required this.addedBy,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.titleAr,
    required this.subtitleAr,
    required this.descriptionAr,
    required this.productId,
    required this.isSlider,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['_id'],
      image: json['image'],
      addedBy: json['addedBy'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      titleAr: json['titleAr'],
      subtitleAr: json['subtitleAr'],
      descriptionAr: json['descriptionAr'],
      productId: json['productId'],
      isSlider: json['isSlider'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'addedBy': addedBy,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'titleAr': titleAr,
      'subtitleAr': subtitleAr,
      'descriptionAr': descriptionAr,
      'productId': productId,
      'isSlider': isSlider,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
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
    return {
      'limit': limit,
      'skip': skip,
      'sort': sort.toJson(),
      'page': page,
    };
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
    return {
      'createdAt': createdAt,
    };
  }
}
