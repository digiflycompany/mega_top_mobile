import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class AddToCartBottomSheet extends StatelessWidget {
  const AddToCartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height*0.407,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: context.height*0.144,
              decoration: BoxDecoration(
                color: AppColors.addToCartBottomSheetBackgroundColor,
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.addToCartBottomSheetBorderColor,
                    width: 1.w,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
                child: Row(
                  children: [
                    Container(
                      width:context.width*0.11,
                      height: context.height*0.055,
                      decoration: const BoxDecoration(
                        color:AppColors.primaryGreenColor,
                        shape: BoxShape.circle
                      ),
                      child: Center(child: SvgPicture.asset(AppAssets.checkMediumIcon,)),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
