import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/spacer.dart';
import 'customer_address_shipping_card.dart';
import 'customer_name_shipping_card.dart';
import 'customer_phone_shipping_card.dart';

class CustomerDetailsShippingAddress extends StatelessWidget {
  final String? customerName;
  final String? customerAddress;
  final String? customerPhone;
  const CustomerDetailsShippingAddress({super.key, this.customerName, this.customerAddress, this.customerPhone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.width*0.088),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomerNameShippingCard(name: customerName,),
          VerticalSpace(context.height*0.006),
          CustomerAddressShippingCard(address: customerAddress,),
          VerticalSpace(context.height*0.006),
          CustomerPhoneShippingCard(phone: customerPhone,),
        ],
      ),
    );
  }
}
