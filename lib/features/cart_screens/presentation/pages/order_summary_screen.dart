import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_details_text.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';
import '../widgets/order_details_description.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.orderSummaryEn,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:context.height*0.033 ),
              child: Container(
                width: double.infinity,
                height: context.height*0.284,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.w,color: AppColors.smallContainerGreyColor),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height*0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const OrderDetailsText(),
                       Divider(color:AppColors.smallContainerGreyColor,thickness: 1.w,),
                       const OrderDetailsDescription()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
