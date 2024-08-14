import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_number_text.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_state_box.dart';

class OrderNumberAndState extends StatelessWidget {
  final String? orderStatus;
  final Color? statusColor;
  final Color? textColor;
  final double? horizontalPadding;
  const OrderNumberAndState({super.key, this.orderStatus, this.statusColor, this.horizontalPadding, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding??0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: OrderNumber(orderNumber: AppStrings.orderNumberEn,textColor: textColor,)),
          Expanded(child: OrderStateBox(text: orderStatus??AppStrings.inProgressEn,color: statusColor??AppColors.yellowColor,)),
        ],
      ),
    );
  }
}
