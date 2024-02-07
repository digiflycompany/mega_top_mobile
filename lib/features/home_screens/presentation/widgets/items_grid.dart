import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';

class ProductsGridContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productType;
  final String? productPrice;
  final String? discountPercent;
  final bool? discount;
  const ProductsGridContainer({super.key, this.productPhoto, this.productName, this.productType, this.productPrice, this.discount=false, this.discountPercent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:context.width*0.43,
      height: context.height*0.325,
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
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: context.width*0.022,right: context.width*0.022,top: context.height*0.012,bottom:context.height*0.01 ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: context.height*0.174,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.height*0.0065),
                    color: AppColors.iconsBackgroundColor,
                  ),
                  child:Center(child: Padding(
                    padding:  EdgeInsets.only(top: context.height*0.012),
                    child: Image.asset(productPhoto!,width: context.width*0.2,),
                  )),
                ),
                discount==true?Padding(
                  padding:  EdgeInsets.symmetric(vertical:context.height*0.012,horizontal:context.width*0.022),
                  child: DiscountContainer(
                    discountPercent: discountPercent,
                    width: context.width*0.1,
                    height:context.height*0.028,
                  ),
                ):Container(),
                Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical:context.height*0.012,horizontal:context.width*0.022),
                      child: SvgPicture.asset(AppAssets.favourOutlinedIcon,width: context.width*0.054,),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(left:context.width*0.022,right:context.width*0.022,bottom: context.height*0.012),
              child:  Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      productName!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12
                      ),
                    ),
                  ),
                  VerticalSpace(context.height*0.006 ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      productType!,
                      style: const TextStyle(
                          color: AppColors.greyTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 10
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const AvailableContainer(),
                      const Spacer(),
                      Text(
                        productPrice!,
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
