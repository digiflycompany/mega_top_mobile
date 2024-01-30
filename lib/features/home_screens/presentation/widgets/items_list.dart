import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class ProductsListContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productType;
  final String? productPrice;
  final String? discountPercent;
  final bool? discount;
  const ProductsListContainer({super.key, this.productPhoto, this.productName, this.productType, this.productPrice, this.discount=false, this.discountPercent});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Container(
                    width: context.width*0.1,
                    height:context.height*0.028,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(context.height*0.003),
                        color: AppColors.redIconColor
                    ),
                    child:  Center(
                      child: Text(
                        discountPercent!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12
                        ),
                      ),
                    ),
                  ),
                ):Container(),
                // Align(
                //     alignment: AlignmentDirectional.topEnd,
                //     child: Padding(
                //       padding:  EdgeInsets.symmetric(vertical:context.height*0.012,horizontal:context.width*0.022),
                //       child: SvgPicture.asset(AppAssets.favourOutlinedIcon,width: context.width*0.054,),
                //     )),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(right: context.width*0.045,top: context.height*0.03,bottom: context.height*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        productName!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 13
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppAssets.favourOutlinedIcon,width: context.width*0.06,)
                    ],
                  ),
                  Text(
                        productType!,
                        style: const TextStyle(
                            color: AppColors.greyTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 10
                        ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        width: context.width*0.2,
                        height: context.height*0.033,
                        decoration: BoxDecoration(
                            color:AppColors.smallContainerGreyColor,
                            borderRadius: BorderRadius.circular(context.height*0.003)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.smallCheckIcon),
                            HorizontalSpace(context.width*0.011),
                            const Text(
                              AppStrings.availableEn,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10
                              ),
                            )
                          ],
                        ),
                      ),
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
                  ),
                  //VerticalSpace(context.height*0.013),

                  // Row(
                  //       children: [
                  //         Container(
                  //           width: context.width*0.2,
                  //           height: context.height*0.033,
                  //           decoration: BoxDecoration(
                  //               color:AppColors.smallContainerGreyColor,
                  //               borderRadius: BorderRadius.circular(context.height*0.003)
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               SvgPicture.asset(AppAssets.smallCheckIcon),
                  //               HorizontalSpace(context.width*0.011),
                  //               const Text(
                  //                 AppStrings.availableEn,
                  //                 style: TextStyle(
                  //                     color: Colors.black,
                  //                     fontWeight: FontWeight.w700,
                  //                     fontSize: 10
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         const Spacer(),
                  //         Text(
                  //           productPrice!,
                  //           style: const TextStyle(
                  //               color: AppColors.primaryColor,
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.w700
                  //           ),
                  //         )
                  //       ],
                  //     )
                ],
              ),
            ),
          ),
          // Column(
          //   children: [
          //     Text(
          //       productName!,
          //       style: const TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.w700,
          //           fontSize: 12
          //       ),
          //     ),
          //     VerticalSpace(context.height*0.009),
          //     Text(
          //       productType!,
          //       style: const TextStyle(
          //           color: AppColors.greyTextColor,
          //           fontWeight: FontWeight.w600,
          //           fontSize: 10
          //       ),
          //     ),
          //     VerticalSpace(context.height*0.013),
          //     Row(
          //       children: [
          //         Container(
          //           width: context.width*0.2,
          //           height: context.height*0.033,
          //           decoration: BoxDecoration(
          //               color:AppColors.smallContainerGreyColor,
          //               borderRadius: BorderRadius.circular(context.height*0.003)
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               SvgPicture.asset(AppAssets.smallCheckIcon),
          //               HorizontalSpace(context.width*0.011),
          //               const Text(
          //                 AppStrings.availableEn,
          //                 style: TextStyle(
          //                     color: Colors.black,
          //                     fontWeight: FontWeight.w700,
          //                     fontSize: 10
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //         const Spacer(),
          //         Text(
          //           productPrice!,
          //           style: const TextStyle(
          //               color: AppColors.primaryColor,
          //               fontSize: 12,
          //               fontWeight: FontWeight.w700
          //           ),
          //         )
          //       ],
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
