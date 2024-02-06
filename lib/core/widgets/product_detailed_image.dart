import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';

class ProductDetailedImage extends StatelessWidget {
  const ProductDetailedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height*0.338,
      decoration: const BoxDecoration(
          color: AppColors.onboardingBackgroundColor
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(AppAssets.productBigPhoto,width: context.width*0.4,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: context.height*0.022),
            child: DotsIndicator(
              dotsCount: 3,
              position: 0,
              decorator: DotsDecorator(
                size: Size(context.width*0.12, context.height*0.008),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                activeColor: AppColors.primaryColor,
                color: AppColors.dotsColor,
                activeSize:  Size(context.width*0.12, context.height*0.008),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
