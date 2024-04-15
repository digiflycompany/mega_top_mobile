class LatestProductsModel {
  int? id;
  String? name;
  String? price;
  String? permalink;
  String? image;

  static List<LatestProductsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((jsonItem) => LatestProductsModel.fromJson(jsonItem))
        .toList();
  }
  LatestProductsModel(
      {this.id, this.name, this.price, this.permalink, this.image});

  LatestProductsModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name = json['name'];
      price = json['price'];
      permalink = json['permalink'];
      image = json['image'];
    } catch (e) {
      print('Failed to parse product: $e');
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['permalink'] = this.permalink;
    data['image'] = this.image;
    return data;
  }

  // static List<LatestProductsModel> fromJsonList(List<dynamic> jsonList) {
  //   return jsonList.map((json) => LatestProductsModel.fromJson(json)).toList();
  // }
}
