import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/customer_city_shipping_card.dart';

import 'customer_address_shipping_card.dart';

class CustomerDetailsShippingAddress extends StatelessWidget {
  final String? customerAddress;
  final String? customerCity;
  const CustomerDetailsShippingAddress(
      {super.key, this.customerAddress, this.customerCity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.width * 0.080),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomerAddressShippingCard(
            address: customerAddress,
          ),
          VerticalSpace(context.height * 0.009),
          CustomerCityShippingCard(
            city: customerCity,
          ),
        ],
      ),
    );
  }
}
