class CategoriesModel{
  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  String? taxonomy;
  int? parent;
  List<dynamic>? meta;
  Links? lLinks;

  CategoriesModel({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    this.meta,
    this.lLinks,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      count: json['count'],
      description: json['description'],
      link: json['link'],
      name: json['name'],
      slug: json['slug'],
      taxonomy: json['taxonomy'],
      parent: json['parent'],
      meta: json['meta'] as List<dynamic>?,
      lLinks: json['_links'] != null ? Links.fromJson(json['_links']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['count'] = count;
    data['description'] = description;
    data['link'] = link;
    data['name'] = name;
    data['slug'] = slug;
    data['taxonomy'] = taxonomy;
    data['parent'] = parent;
    if (meta != null) {
      data['meta'] = meta;
    }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<About>? about;
  List<WpPostType>? wpPostType;
  List<Curies>? curies;

  Links({this.self, this.collection, this.about, this.wpPostType, this.curies});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: (json['self'] as List<dynamic>?)?.map((e) => Self.fromJson(e)).toList(),
      collection: (json['collection'] as List<dynamic>?)?.map((e) => Collection.fromJson(e)).toList(),
      about: (json['about'] as List<dynamic>?)?.map((e) => About.fromJson(e)).toList(),
      wpPostType: (json['wp:post_type'] as List<dynamic>?)?.map((e) => WpPostType.fromJson(e)).toList(),
      curies: (json['curies'] as List<dynamic>?)?.map((e) => Curies.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (self != null) {
      data['self'] = self!.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      data['collection'] = collection!.map((v) => v.toJson()).toList();
    }
    if (about != null) {
      data['about'] = about!.map((v) => v.toJson()).toList();
    }
    if (wpPostType != null) {
      data['wp:post_type'] = wpPostType!.map((v) => v.toJson()).toList();
    }
    if (curies != null) {
      data['curies'] = curies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'href': href};
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  factory Curies.fromJson(Map<String, dynamic> json) {
    return Curies(
      name: json['name'],
      href: json['href'],
      templated: json['templated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'href': href,
      'templated': templated,
    };
  }
}

class Collection {
  Collection.fromJson(Map<String, dynamic> json) {
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class About {
  About.fromJson(Map<String, dynamic> json) {
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class WpPostType {
  WpPostType.fromJson(Map<String, dynamic> json) {
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}


class Category {
  final String categoryPhoto;
  final String categoryName;


  Category({
    required this.categoryPhoto,
    required this.categoryName,

  });
}
