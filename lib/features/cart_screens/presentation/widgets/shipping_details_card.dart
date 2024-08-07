import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_card_options.dart';
import 'customer_details_shipping_card.dart';

class ShippingDetailsCard extends StatelessWidget {
  final String? customerName;
  final String? customerAddress;
  final String? customerCity;
  final bool isSelected;
  final Function()? editOnTap;
  final Function()? removeOnTap;
  const ShippingDetailsCard(
      {super.key,
        this.customerName,
        this.customerAddress,
        this.customerCity,
        this.isSelected=false, this.editOnTap, this.removeOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.width * 0.045),
      child: Container(
        width: double.infinity,
        height: context.height * 0.23,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.iconsBackgroundColor : Colors.white,
          border: Border.all(
              width: 1.w,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.iconsBackgroundColor
                  : AppColors.transparent,
              offset: isSelected ? const Offset(0, 2) : const Offset(0, 2),
              blurRadius: isSelected ? 12 : 0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.045,
              vertical: context.height * 0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShippingCardOptions(
                customerName: customerName,
                editOnTap: editOnTap,
                removeOnTap: removeOnTap,
              ),
              VerticalSpace(context.height * 0.0165),
              Divider(
                thickness: 1.w,
                color: AppColors.onboardingBackgroundColor,
              ),
              VerticalSpace(context.height * 0.0165),
              CustomerDetailsShippingAddress(
                customerAddress: customerAddress,
                customerCity: customerCity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
