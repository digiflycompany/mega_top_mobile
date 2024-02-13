import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';
import '../widgets/select_the_delivery_address_text.dart';

class ShippingDetailsPage extends StatelessWidget {
  const ShippingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const PrimaryAppBar(
              AppStrings.shippingDetailsEn,
              favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SelectTheDeliveryAddressText(),
            Container(
              width: double.infinity,
              height: context.height*0.252,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width:1.w,color: AppColors.smallContainerGreyColor),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width*0.045,vertical:context.height*0.022),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.locationOutlinedIcon),
                        HorizontalSpace(context.width*0.022),
                        Text(
                            AppStrings.homeEn,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp
                            ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppAssets.editSmallIcon),
                        HorizontalSpace(context.width*0.011),
                        Text(
                          AppStrings.editEn,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp
                          ),
                        ),
                        HorizontalSpace(context.width*0.045),
                        SvgPicture.asset(AppAssets.basketIcon),
                        HorizontalSpace(context.width*0.011),
                        Text(
                          AppStrings.removeEn,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp
                          ),
                        ),
                      ],
                    ),
                    VerticalSpace(context.height*0.0165),
                    Divider(thickness:1.w ,color: AppColors.onboardingBackgroundColor,),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: context.width*0.088),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              AppStrings.customerNameEn,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                          ),
                          VerticalSpace(context.height*0.006),
                          Text(
                            AppStrings.addressNasrCityEn,
                            style: TextStyle(
                              color: AppColors.greyTextColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          VerticalSpace(context.height*0.006),
                          Text(
                            AppStrings.telephoneAddressEn,
                            style: TextStyle(
                              color: AppColors.greyTextColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
