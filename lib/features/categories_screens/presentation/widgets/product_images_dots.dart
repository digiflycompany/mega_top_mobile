import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';


class ProductImagesDots extends StatelessWidget {
  const ProductImagesDots({super.key, required this.imageLength, required this.imagePosition});

 final int imageLength;
 final int imagePosition;


  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.022),
          child: DotsIndicator(
            dotsCount: imageLength,
            position: imagePosition,
            decorator: DotsDecorator(
              //   size: Size(context.width * 0.12, context.height * 0.008),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeColor: AppColors.primaryColor,
              color: AppColors.dotsColor,
              // activeSize: Size(context.width * 0.12, context.height * 0.008),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        );
  }
}
