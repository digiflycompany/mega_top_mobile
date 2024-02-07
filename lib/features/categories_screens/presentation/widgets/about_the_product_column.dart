import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class AboutTheProductColumn extends StatelessWidget {
  const AboutTheProductColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// About The Product Text ///
        const Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            AppStrings.aboutTheProductEn,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16
            ),
          ),
        ),
        VerticalSpace(context.height*0.021),
        Divider(thickness: context.width*0.003,color: AppColors.smallContainerGreyColor,),
        VerticalSpace(context.height*0.021),
        /// About The Product Description ///
        const Text(
            AppStrings.aboutProductDescriptionEn,
            style: TextStyle(
              color: AppColors.smallTextBlackColor,
              fontWeight: FontWeight.w500,
              fontSize: 14
            ),
        )
      ],
    );
  }
}
