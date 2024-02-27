import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_number_text.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_state_box.dart';

class OrderNumberAndState extends StatelessWidget {
  final String? orderStatus;
  const OrderNumberAndState({super.key, this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const OrderNumber(orderNumber: AppStrings.orderNumberEn,),
        HorizontalSpace(context.width12),
        OrderStateBox(text: orderStatus??AppStrings.waitingForConfirmationEn),
      ],
    );
  }
}
