import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../../../core/utils/app_color.dart';

class LatestOffersContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productDiscount;
  const LatestOffersContainer({super.key, this.productPhoto, this.productName, this.productDiscount});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: context.width*0.246,
      height: context.height*0.124,
      decoration: BoxDecoration(
        color: AppColors.onboardingBackgroundColor,
        borderRadius: BorderRadius.circular(context.height*0.006),
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: context.height*0.012),
        child: Column(
          children: [
            Image.asset(productPhoto!,width: context.width*0.095,),
            VerticalSpace(context.height*0.008),
            Text(
                productName!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.sp
                ),
            ),
            VerticalSpace(context.height*0.0026),
            Text(
              productDiscount!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 8.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
