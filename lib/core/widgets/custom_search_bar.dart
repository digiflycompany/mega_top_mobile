import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.012),
      child: GestureDetector(
        onTap: () {
          Routes.searchPageRoute.moveTo;
        },
        child: Container(
          width: double.infinity,
          height: context.height * 0.068,
          decoration: BoxDecoration(
            color: AppColors.circleAvatarBackground,
            borderRadius: BorderRadius.circular(context.height * 0.006),
          ),
          child: Row(
            children: [
              HorizontalSpace(context.width * 0.045),
              SvgPicture.asset(AppAssets.searchIcon),
              HorizontalSpace(context.width * 0.022),
              Text(
                AppLocalizations.of(context)!.searchHere,
                style: TextStyle(
                    color: AppColors.blackGreyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
              // const Spacer(),
              // Container(
              //   width: context.width * 0.145,
              //   height: double.infinity,
              //   decoration: BoxDecoration(
              //     color: AppColors.primaryColor,
              //     borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(context.height * 0.006),
              //       bottomRight: Radius.circular(context.height * 0.006),
              //     ),
              //   ),
              //   child: Padding(
              //     padding:
              //         EdgeInsets.symmetric(horizontal: context.width * 0.045),
              //     child: SvgPicture.asset(AppAssets.filterWhiteIcon),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
