import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_number_text.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_state_box.dart';

class OrderNumberAndState extends StatelessWidget {
  final String? orderStatus;
  final String? orderId;
  final Color? statusColor;
  final Color? textColor;
  final double? horizontalPadding;
  const OrderNumberAndState({super.key, this.orderStatus, this.statusColor, this.horizontalPadding, this.textColor, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding??0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex:1,child: OrderNumber(orderNumber: orderId,textColor: textColor,)),
          Expanded(flex:1,child: OrderStateBox(text: orderStatus??AppStrings.inProgressEn,color: statusColor??AppColors.yellowColor,)),
        ],
      ),
    );
  }
}
