import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/customer_name_shipping_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/customer_phone_shipping_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_card_options.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import 'customer_address_shipping_card.dart';

class ShippingDetailsCard extends StatelessWidget {
  const ShippingDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const ShippingCardOptions(deliveryPlace: AppStrings.homeEn,),
            VerticalSpace(context.height*0.0165),
            Divider(thickness:1.w ,color: AppColors.onboardingBackgroundColor,),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: context.width*0.088),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const CustomerNameShippingCard(name: AppStrings.homeEn,),
                  VerticalSpace(context.height*0.006),
                  const CustomerAddressShippingCard(address: AppStrings.addressNasrCityEn,),
                  VerticalSpace(context.height*0.006),
                  const CustomerPhoneShippingCard(phone: AppStrings.telephoneAddressEn,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
