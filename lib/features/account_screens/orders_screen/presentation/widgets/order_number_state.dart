import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_number_text.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_state_box.dart';

class OrderNumberAndState extends StatelessWidget {
  const OrderNumberAndState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderNumber(orderNumber: AppStrings.orderNumberEn,),
        OrderStateBox(text: AppStrings.waitingForConfirmationEn),
      ],
    );
  }
}
