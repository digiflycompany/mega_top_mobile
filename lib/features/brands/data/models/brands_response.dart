class BrandsResponse {
  bool? success;
  Data? data;

  BrandsResponse({this.success, this.data});

  factory BrandsResponse.fromJson(Map<String, dynamic> json) {
    return BrandsResponse(
        success: json['success'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data?.toJson()};
  }
}

class Data {
  List<Brand>? brands;
  Options? options;

  Data({this.brands, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        brands: json['brands'] != null
            ? (json['brands'] as List).map((e) => Brand.fromJson(e)).toList()
            : null,
        options:
            json['options'] != null ? Options.fromJson(json['options']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'brands': brands?.map((e) => e.toJson()).toList(),
      'options': options?.toJson()
    };
  }
}

class Brand {
  String? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? v;

  Brand(
      {this.id, this.name, this.image, this.createdAt, this.updatedAt, this.v});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
        id: json['_id'],
        name: json['name'],
        image: json['image'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        v: json['__v']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v
    };
  }
}

class Options {
  int? limit;
  int? skip;
  Sort? sort;
  int? page;

  Options({this.limit, this.skip, this.sort, this.page});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
        limit: json['limit'],
        skip: json['skip'],
        sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
        page: json['page']);
  }

  Map<String, dynamic> toJson() {
    return {'limit': limit, 'skip': skip, 'sort': sort?.toJson(), 'page': page};
  }
}

class Sort {
  String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    return {'createdAt': createdAt};
  }
}