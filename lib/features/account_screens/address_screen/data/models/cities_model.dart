class CitiesModel {
  final bool success;
  final Data? data;
  final String? message;
  final int? statusCode;
  final int? errorCode;

  CitiesModel({
    required this.success,
    this.data,
    this.message,
    this.statusCode,
    this.errorCode,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
      success: json['success'] ?? false,
      data: json['success'] == true ? Data.fromJson(json['data']) : null,
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (success) {
      data['data'] = this.data?.toJson();
    } else {
      data['message'] = message;
      data['statusCode'] = statusCode;
      data['errorCode'] = errorCode;
    }
    return data;
  }
}

class Data {
  final List<City> cities;
  final Options options;

  Data({
    required this.cities,
    required this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      cities: (json['cities'] as List).map((i) => City.fromJson(i)).toList(),
      options: Options.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cities'] = cities.map((v) => v.toJson()).toList();
    data['options'] = options.toJson();
    return data;
  }
}

class City {
  final String id;
  final String name;
  final String nameAr;
  final String countryId;
  final String countryName;
  final String countryNameAr;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final int v;

  City({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.countryId,
    required this.countryName,
    required this.countryNameAr,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      nameAr: json['nameAr'] ?? '',
      countryId: json['countryId'] ?? '',
      countryName: json['countryName'] ?? '',
      countryNameAr: json['countryNameAr'] ?? '',
      isActive: json['isActive'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['nameAr'] = nameAr;
    data['countryId'] = countryId;
    data['countryName'] = countryName;
    data['countryNameAr'] = countryNameAr;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
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
      limit: json['limit'] ?? 0,
      skip: json['skip'] ?? 0,
      sort: Sort.fromJson(json['sort']),
      page: json['page'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['skip'] = skip;
    data['sort'] = sort.toJson();
    data['page'] = page;
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
      createdAt: json['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    return data;
  }
}
