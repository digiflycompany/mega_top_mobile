import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_small_description.dart';
import '../../../../core/utils/app_color.dart';
import 'card_title_text.dart';

class ShippingDetailsSmallCard extends StatelessWidget {
  const ShippingDetailsSmallCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:context.height*0.033 ),
      child: Container(
        width: double.infinity,
        height: context.height*0.2235,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.w,color: AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height*0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardTitleText(title: AppStrings.shippingDetailsEn,),
              Divider(color:AppColors.smallContainerGreyColor,thickness: 1.w,),
              const ShippingDetailsSmallDescription()
            ],
          ),
        ),
      ),
    );
  }
}
