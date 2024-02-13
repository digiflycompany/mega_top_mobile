import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/arithmetic_container.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_routes.dart';

class CartItemsContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productType;
  final String? productPrice;
  final String? discountPercent;
  final bool? discount;
  const CartItemsContainer({super.key, this.productPhoto, this.productName, this.productType, this.productPrice, this.discount=false, this.discountPercent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.categoryProductDetailsPageRoute.moveTo,
      child: Container(
        width:double.infinity,
        height: context.height*0.165,
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
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: context.width*0.022,right: context.width*0.045,top: context.height*0.012,bottom:context.height*0.012 ),
              child: Stack(
                children: [
                  Container(
                    width: context.width*0.332,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.height*0.0065),
                      color: AppColors.iconsBackgroundColor,
                    ),
                    child:Center(child: Padding(
                      padding:  EdgeInsets.only(top: context.height*0.016),
                      child: Image.asset(productPhoto!,width: context.width*0.16,),
                    )),
                  ),
                  discount==true?Padding(
                    padding:  EdgeInsets.symmetric(vertical:context.height*0.009,horizontal:context.width*0.016),
                    child: DiscountContainer(
                      discountPercent: discountPercent,
                      width: context.width*0.1,
                      height:context.height*0.028,
                    ),
                  ):Container(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(right: context.width*0.045,top: context.height*0.03,bottom: context.height*0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp
                      ),
                    ),
                    /// Product Type
                    Text(
                      productType!,
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        /// Product Price
                        Text(
                          productPrice!,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        /// Plus Icon
                        const ArithmeticContainer(
                          icon: AppAssets.plusIcon,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
