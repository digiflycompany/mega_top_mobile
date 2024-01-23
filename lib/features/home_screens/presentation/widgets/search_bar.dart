import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../../../core/utils/app_routes.dart';

class PrimarySearchBar extends StatelessWidget {
  const PrimarySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:context.height*0.012),
      child: GestureDetector(
        onTap: (){
          Routes.searchPageRoute.moveTo;
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
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.searchHereEn,
                    hintStyle: TextStyle(
                      color: AppColors.blackGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                width: context.width*0.138,
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
