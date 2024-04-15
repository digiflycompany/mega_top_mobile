class LatestProductsModel {
  int? id;
  String? name;
  String? price;
  String? permalink;
  String? image;

  LatestProductsModel(
      {this.id, this.name, this.price, this.permalink, this.image});

  LatestProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    permalink = json['permalink'];
    image = json['image'];
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
}
