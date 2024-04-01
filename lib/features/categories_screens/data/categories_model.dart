class CategoriesModel {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  Image? image;
  int? menuOrder;
  int? count;
  Meta? meta;
  Translations? translations;
  String? lang;
  Links? links;
  static List<CategoriesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((jsonItem) => CategoriesModel.fromJson(jsonItem))
        .toList();
  }

  CategoriesModel({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.meta,
    this.translations,
    this.lang,
    this.links,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        parent: json['parent'],
        description: json['description'],
        display: json['display'],
        image: json['image'] != null ? Image.fromJson(json['image']) : null,
        menuOrder: json['menu_order'],
        count: json['count'],
        meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
        translations: json['translations'] != null
            ? Translations.fromJson(json['translations'])
            : null,
        lang: json['lang'],
        links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'parent': parent,
        'description': description,
        'display': display,
        'image': image?.toJson(),
        'menu_order': menuOrder,
        'count': count,
        'meta': meta?.toJson(),
        'translations': translations?.toJson(),
        'lang': lang,
        '_links': links?.toJson(),
      };
}

class Image {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  Image({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'],
        dateCreated: json['date_created'],
        dateCreatedGmt: json['date_created_gmt'],
        dateModified: json['date_modified'],
        dateModifiedGmt: json['date_modified_gmt'],
        src: json['src'],
        name: json['name'],
        alt: json['alt'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_created': dateCreated,
        'date_created_gmt': dateCreatedGmt,
        'date_modified': dateModified,
        'date_modified_gmt': dateModifiedGmt,
        'src': src,
        'name': name,
        'alt': alt,
      };
}

class Meta {
  List<String>? order;
  List<String>? displayType;
  List<String>? thumbnailId;
  List<String>? productCountProductCat;

  Meta({
    this.order,
    this.displayType,
    this.thumbnailId,
    this.productCountProductCat,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        order: List<String>.from(json['order']),
        displayType: List<String>.from(json['display_type']),
        thumbnailId: List<String>.from(json['thumbnail_id']),
        productCountProductCat:
            List<String>.from(json['product_count_product_cat']),
      );

  Map<String, dynamic> toJson() => {
        'order': order,
        'display_type': displayType,
        'thumbnail_id': thumbnailId,
        'product_count_product_cat': productCountProductCat,
      };
}

class Translations {
  int? en;
  int? ar;

  Translations({this.en, this.ar});

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        en: json['en'],
        ar: json['ar'],
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'ar': ar,
      };
}

class Links {
  List<Link>? self;
  List<Link>? collection;
  List<Link>? up;

  Links({this.self, this.collection, this.up});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Link>.from(json['self'].map((x) => Link.fromJson(x))),
        collection:
            List<Link>.from(json['collection'].map((x) => Link.fromJson(x))),
        up: json['up'] != null
            ? List<Link>.from(json['up'].map((x) => Link.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'self': self?.map((x) => x.toJson()).toList(),
        'collection': collection?.map((x) => x.toJson()).toList(),
        'up': up?.map((x) => x.toJson()).toList(),
      };
}

class Link {
  String? href;

  Link({this.href});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        href: json['href'],
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}

class Category {
  final String categoryPhoto;
  final String categoryName;

  Category({
    required this.categoryPhoto,
    required this.categoryName,
  });
}
