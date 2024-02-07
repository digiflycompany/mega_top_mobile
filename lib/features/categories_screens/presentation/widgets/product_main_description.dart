import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_name.dart';

class ProductMainDescription extends StatelessWidget {
  const ProductMainDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:context.height*0.033 ),
      child: Column(
        children: [
          Row(
            children: [
              const ProductNameText(name: AppStrings.upsVersion1En,),
              const Spacer(),
              const AvailableContainer(),
              HorizontalSpace(context.width*0.022),
              DiscountContainer(
                width: context.width*0.118,
                height: context.height*0.033,
                discountPercent: AppStrings.discountPercentEn,
              )
            ],
          ),
          VerticalSpace(context.height*0.012),
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              AppStrings.storageUnitsEn,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.greyTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
