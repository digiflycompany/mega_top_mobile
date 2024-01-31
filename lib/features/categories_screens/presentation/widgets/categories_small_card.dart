import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';

class CategoriesSmallCard extends StatelessWidget {
  final String? categoryPhoto;
  final String? categoryName;
  const CategoriesSmallCard({super.key, this.categoryPhoto, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width*0.285,
      height: context.height*0.141,
      decoration: BoxDecoration(
        color: AppColors.iconsBackgroundColor,
        border: Border.all(width: context.width*0.002,color: AppColors.onboardingBackgroundColor),
        borderRadius: BorderRadius.circular(context.height*0.006),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: context.height*0.011),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(categoryPhoto!,width: context.width*0.18,),
            Text(
              categoryName!,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14
              ),
            )
          ],
        ),
      ),
    );
  }
}
