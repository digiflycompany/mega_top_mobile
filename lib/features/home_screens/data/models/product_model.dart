class Product {
  final String productName;
  final String productPhoto;
  final String productType;
  final String productPrice;
  final String discountPercent;
  final bool discount;
  final String status;
  Product(
      {
    required this.productName,
    required this.productPhoto,
    required this.productType,
    required this.productPrice,
    required this.discountPercent,
    this.status='',
    this.discount = true,
  });
}
