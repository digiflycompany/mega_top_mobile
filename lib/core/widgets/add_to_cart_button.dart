import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/spacer.dart';

class AddToCartButton extends StatelessWidget {
  final Function()? onTap;
  const AddToCartButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height*0.141,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045,vertical:context.height*0.037),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(context.height*0.006)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.cartButtonIcon,width: context.width*0.066,),
                HorizontalSpace(context.width*0.022),
                 Text(
                  AppStrings.addToCartEn,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
