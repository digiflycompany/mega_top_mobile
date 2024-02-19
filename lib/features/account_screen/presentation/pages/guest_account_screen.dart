import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screen/presentation/widgets/option_item.dart';

class GuestAccountScreen extends StatelessWidget {
  const GuestAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.accountEn)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpace(40.h),
              Image.asset(
                AppAssets.megaTopLogo,
                height: 80.h,
              ),
              VerticalSpace(30.h),
              Text(AppStrings.welcomeToMegaTopEn,
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp)),
              Text(AppStrings.loginOrCreateEnEn,
                  style: TextStyle(fontSize: 12.sp)),
              VerticalSpace(40.h),
              PrimaryButton(
                text: AppStrings.signUpEn,
                onTap: () {
                  Routes.userAccountPageRoute.moveTo;
                },
              ),
              VerticalSpace(24.h),
              const PrimaryOutlinedButton(
                text: AppStrings.loginEn,
              ),
              VerticalSpace(50.h),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    AppStrings.accountEn,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.smallTextBlackColor),
                  )),
              VerticalSpace(25.h),
              OptionItem(
                mainIcon: AppAssets.notificationIcon,
                title: AppStrings.notifications,
                optionalData: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.iconsBackgroundColor,
                  ),
                  width: 24.h,
                  height: 24.h,
                  child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              VerticalSpace(40.h),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(AppStrings.settings,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.smallTextBlackColor))),
              VerticalSpace(25.h),
              OptionItem(
                mainIcon: AppAssets.languageIcon,
                title: AppStrings.languages,
                optionalData: Text(AppStrings.selectedLanguage,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp)),
              ),
              VerticalSpace(40.h),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(AppStrings.contactUs,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.smallTextBlackColor))),
              VerticalSpace(25.h),
              const OptionItem(
                mainIcon: AppAssets.callIcon,
                title: AppStrings.callUs,
              ),
              VerticalSpace(16.h),
              const OptionItem(
                mainIcon: AppAssets.information,
                title: AppStrings.aboutUs,
              ),
              VerticalSpace(16.h),
              const OptionItem(
                mainIcon: AppAssets.information,
                title: AppStrings.termsAndConditions,
              ),
              VerticalSpace(16.h),
              const OptionItem(
                mainIcon: AppAssets.information,
                title: AppStrings.privacyPolicy,
              ),
              VerticalSpace(33.h),
            ],
          ),
        ),
      ),
    );
  }
}
