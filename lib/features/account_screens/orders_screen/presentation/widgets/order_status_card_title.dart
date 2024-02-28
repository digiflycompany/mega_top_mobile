import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_state_box.dart';

class OrderStatusCardTitle extends StatelessWidget {
  final String? title;
  final String? status;
  final Color? boxColor;
  const OrderStatusCardTitle({super.key, this.title, this.status, this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: context.height * 0.022, left: context.width * 0.045),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
                color: AppColors.smallTextBlackColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          ),
          OrderStateBox(text:status,color: boxColor,)
        ],
      ),
    );
  }
}
