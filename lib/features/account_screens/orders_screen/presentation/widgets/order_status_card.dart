import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_number_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/stepper_widgets/custom_stepper.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/custom_divider.dart';

class OrderStatusCard extends StatelessWidget {
  final String? orderStatus;
  final Color? boxColor;
  const OrderStatusCard({super.key, this.orderStatus, this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height24),
      child: Container(
        width: double.infinity,
        //height: context.height306,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
          Border.all(width: 1.w, color: AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderNumberAndState(orderStatus: orderStatus,statusColor: boxColor,horizontalPadding: context.width16,textColor: AppColors.smallTextBlackColor,),
              CustomDivider(
                topPadding: context.height16,
                bottomPadding: context.height16,
              ),
              CustomStepper(),
            ],
          ),
        ),
      ),
    );
  }
}
