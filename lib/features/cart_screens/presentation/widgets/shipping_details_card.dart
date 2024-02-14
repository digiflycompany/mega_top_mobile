import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_card_options.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';
import 'customer_details_shipping_card.dart';

class ShippingDetailsCard extends StatelessWidget {
  final String? deliveryPlace;
  final String? customerName;
  final String? customerAddress;
  final String? customerPhone;
  const ShippingDetailsCard({super.key, this.deliveryPlace, this.customerName, this.customerAddress, this.customerPhone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.width*0.045),
      child: Container(
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
              ShippingCardOptions(deliveryPlace: deliveryPlace,),
              VerticalSpace(context.height*0.0165),
              Divider(thickness:1.w ,color: AppColors.onboardingBackgroundColor,),
              const Spacer(),
              CustomerDetailsShippingAddress(
                customerName: customerName,
                customerAddress: customerAddress,
                customerPhone: customerPhone,
              )
            ],
          ),
        ),
      ),
    );
  }
}
