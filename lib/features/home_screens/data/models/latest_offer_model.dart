class LatestOfferModel {
  List<LatestOfferItem> latestOfferList = [];

  LatestOfferModel.fromJson(List<dynamic> jsonList) {
    jsonList.forEach((element) {
      latestOfferList.add(LatestOfferItem.fromJson(element));
    });
  }
}

class LatestOfferItem {
  late int id;
  late String name;
  late String image;

  LatestOfferItem.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }
}
