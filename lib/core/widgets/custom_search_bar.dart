import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:context.height*0.012),
      child: GestureDetector(
        onTap: (){

        },
        child: Container(
          width: double.infinity,
          height: context.height*0.068,
          decoration: BoxDecoration(
            color: AppColors.circleAvatarBackground,
            borderRadius: BorderRadius.circular(context.height*0.006),
          ),
          child: Row(
            children: [
              HorizontalSpace(context.width*0.045),
              SvgPicture.asset(AppAssets.searchIcon),
              HorizontalSpace(context.width*0.022),
              const Text(
                AppStrings.searchHereEn,
                style: TextStyle(
                  color: AppColors.blackGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
              const Spacer(),
              Container(
                width: 52,
                height: double.infinity,
                decoration:  BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight:Radius.circular(context.height*0.006),
                      bottomRight:Radius.circular(context.height*0.006),
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:context.width*0.045),
                  child: SvgPicture.asset(AppAssets.filterWhiteIcon),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
