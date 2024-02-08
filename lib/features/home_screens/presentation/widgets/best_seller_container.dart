import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';

class BestSellerContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productType;
  final String? productPrice;
  final String? discountPercent;
  final bool? discount;
  const BestSellerContainer({super.key, this.productPhoto, this.productName, this.productType, this.productPrice, this.discount=false, this.discountPercent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:context.width*0.707,
      height: context.height*0.424125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.height*0.0065),
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadow,
            offset: Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: context.width*0.022,right: context.width*0.022,top: context.height*0.012,bottom:context.height*0.015 ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: context.height*0.269,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.height*0.0065),
                      color: AppColors.iconsBackgroundColor,
                    ),
                    child:Center(child: Image.asset(productPhoto!,width: context.width*0.27,)),
                  ),
                  discount==true?Padding(
                    padding:  EdgeInsets.symmetric(vertical:context.height*0.012,horizontal:context.width*0.022),
                    child: DiscountContainer(
                      width: context.width*0.11,
                      height:context.height*0.033,
                      discountPercent: discountPercent,
                    ),
                  ):Container(),
                  Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical:context.height*0.022,horizontal:context.width*0.045),
                        child: SvgPicture.asset(AppAssets.favourOutlinedIcon),
                      )),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:context.width*0.045,right:context.width*0.045,bottom:context.height*0.022),
              child:  Column(
                children: [
                   Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      productName!,
                      style:  TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                    ),
                  ),
                  VerticalSpace(context.height*0.009),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      productType!,
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp
                      ),
                    ),
                  ),
                  VerticalSpace(context.height*0.012),
                  Row(
                    children: [
                      const AvailableContainer(),
                      const Spacer(),
                      Text(
                        productPrice!,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
