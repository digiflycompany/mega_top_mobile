class SelectedCategoriesModel {
  List<productModel> productList = [];

  SelectedCategoriesModel.fromJson(List<dynamic> jsonList) {
    jsonList.forEach((element) {
      productList.add(productModel.fromJson(element));
    });
  }
}

class productModel {
  late int id;
  late String name;
  late String price;
  List<Images> images = [];
  List<Categories> categories = [];

  productModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    json["images"].forEach((element) {
      images.add(Images.fromJson(element));
    });
    json["categories"].forEach((element) {
      categories.add(Categories.fromJson(element));
    });
  }
}

class Images {
  late int id;
  late String src;

  Images.fromJson(json) {
    id = json["id"];
    src = json["src"];
  }
}

class Categories {
  late int id;
  late String name;

  Categories.fromJson(json) {
    id = json["id"];
    name = json["name"];
  }
}
