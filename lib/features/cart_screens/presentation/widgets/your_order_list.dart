import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_list_container.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class YourOrderList extends StatelessWidget {
  const YourOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = PreferencesHelper.getCart();
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: cart.length,
      itemBuilder: (BuildContext context, int index) {
        final cartItem = cart[index];
        return Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: context.height * 0.022,
              start: context.width * 0.045,
              end: context.width * 0.045),
          child: YourOrderListContainer(
            productName: cartItem['name'],
            productPhoto: cartItem['image'],
            productPrice: cartItem['price'].toString(),
          ),
        );
      },
    );
  }
}
