import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/data/models/checkout_model.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_list_container.dart';

class YourOrderCheckoutList extends StatelessWidget {
  final List<ProductCheckout>? products;
  const YourOrderCheckoutList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: products!.length,
      itemBuilder: (BuildContext context, int index) {
        final cartItem = products![index];
        return Padding(
          padding: EdgeInsets.only(
              bottom: context.height * 0.022,
              left: context.width * 0.045,
              right: context.width * 0.045),
          child: YourOrderListContainer(
            productName: cartItem.title,
            productPhoto: cartItem.image,
            productPrice: cartItem.finalPrice.toString()
          ),
        );
      },
    );
  }
}
