import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/price_text_field.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            AppStrings.priceBottomSheetEn,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
        VerticalSpace(context.height*0.032),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.fromEn,
              style: TextStyle(
                  color: AppColors.smallTextBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  AppStrings.toEn,
                  style: TextStyle(
                      color: AppColors.smallTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13
                  ),
                ),
              ),
            )
          ],
        ),
        VerticalSpace(context.height*0.022),
        const Row(
          children: [
            PriceTextField(),
            Spacer(),
            PriceTextField(),
          ],
        ),
      ],
    );
  }
}
