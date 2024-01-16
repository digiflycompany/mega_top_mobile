import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_string.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.087),
          child: const CustomAppBar(AppStrings.resetPasswordEn)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
          children: [
            VerticalSpace(context.height*0.055),
            Row(
              children: [
                Container(
                width: context.width*0.176,
                height: context.height*0.087,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                  child: Transform.scale(
                      scale: 0.55,
                      child: SvgPicture.asset(AppAssets.forgetPasswordWhiteIcon,width: 32,height: 32,)),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.iconsBackgroundColor,
                    height: context.height*0.006,
                    width: 60,
                  ),
                ),
                Container(
                  width: context.width*0.176,
                  height: context.height*0.087,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.scale(
                      scale: 0.55,
                      child: SvgPicture.asset(AppAssets.forgetPasswordWhiteIcon,width: 32,height: 32,)),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.iconsBackgroundColor,
                    height: context.height*0.006,
                    width: 60,
                  ),
                ),
                Container(
                  width: context.width*0.176,
                  height: context.height*0.087,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.scale(
                      scale: 0.55,
                      child: SvgPicture.asset(AppAssets.forgetPasswordWhiteIcon,width: 32,height: 32,)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
