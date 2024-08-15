import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/data/models/orders_model.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/product_list_card.dart';

class OrderItemsList extends StatelessWidget {
  final OrderData order;
  const OrderItemsList({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: order.products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = order.products[index];
          return ProductsListCard(
            productName: product.title,
            productPhoto: product.image,
            productType: product.categoryName,
            productPrice: product.finalPrice.toString(),
          );
        },
      ),
    );
  }
}
