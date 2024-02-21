import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_routes.dart';

class CategoriesSmallCard extends StatelessWidget {
  final String? categoryPhoto;
  final String? categoryName;
  const CategoriesSmallCard({super.key, this.categoryPhoto, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.categoryItemsPageRoute.moveTo;
      },
      child: Container(
        width: context.width * 0.24,
        height: context.height * 0.131,
        decoration: BoxDecoration(
          color: AppColors.iconsBackgroundColor,
          border: Border.all(
              width: context.width * 0.002,
              color: AppColors.onboardingBackgroundColor),
          borderRadius: BorderRadius.circular(context.height * 0.006),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.height * 0.011,
              horizontal: context.width * 0.021),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                categoryPhoto!,
                width: context.width * 0.15,
              ),
              Text(
                categoryName!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
