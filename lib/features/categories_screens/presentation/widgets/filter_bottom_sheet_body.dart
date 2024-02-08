import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/brands_checklist.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet_buttons.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/price_container.dart';
import '../../../../core/utils/app_string.dart';

class FilterBottomSheetBody extends StatelessWidget {
  const FilterBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
          children: [
             Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                AppStrings.brandEn,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              ),
            ),
            VerticalSpace(context.height*0.02),
            const BrandsCheckList(),
            VerticalSpace(context.height*0.025),
            const PriceContainer(),
            const Spacer(),
            const FilterBottomSheetButtons(),
          ],
        ),
      ),
    );
  }
}
