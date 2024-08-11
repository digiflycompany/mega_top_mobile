class AddProductModel {
  final String id;
  int quantity;

  AddProductModel({required this.id, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'quantity': quantity,
    };
  }
}
