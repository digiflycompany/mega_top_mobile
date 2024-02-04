import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/brands_checklist.dart';
import '../../../../core/utils/app_string.dart';

class FilterBottomSheetBody extends StatelessWidget {
  const FilterBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
      child: Column(
        children: [
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              AppStrings.brandEn,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          VerticalSpace(context.height*0.033),
          const BrandsCheckList(),
        ],
      ),
    );
  }
}