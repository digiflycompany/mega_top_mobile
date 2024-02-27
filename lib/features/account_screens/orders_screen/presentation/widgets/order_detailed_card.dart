import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_date_day.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_number_state.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/custom_divider.dart';

class OrderDetailedCard extends StatelessWidget {
  final Widget card;
  final String? orderStatus;
  final Color statusColor;
  const OrderDetailedCard({super.key, required this.card, this.orderStatus, this.statusColor=AppColors.yellowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height204,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadow,
            offset: Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width16,vertical: context.height16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderNumberAndState(orderStatus: orderStatus,statusColor: statusColor,),
            VerticalSpace(context.height12),
            const OrderDateAndDay(),
            CustomDivider(
              topPadding: context.height16,
              bottomPadding: context.height16,
            ),
            card,
          ],
        ),
      ),
    );
  }
}
