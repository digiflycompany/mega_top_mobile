import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';

class OurProductsContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productQuantity;
  const OurProductsContainer({super.key, this.productPhoto, this.productName, this.productQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width*0.48575,
      height: context.height*0.098,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.height*0.006),
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadow,
            offset: Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal:context.width*0.037),
        child: Row(
          children: [
            Image.asset(productPhoto!,width: context.width*0.13),
            HorizontalSpace(context.width*0.02),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: context.height*0.02),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  const Spacer(),
                  Text(
                    productQuantity!,
                    style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
