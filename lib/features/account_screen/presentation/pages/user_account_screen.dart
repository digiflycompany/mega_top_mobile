import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/features/account_screen/presentation/widgets/option_item.dart';
import 'package:mega_top_mobile/features/account_screen/presentation/widgets/user_information.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

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
              VerticalSpace(25.h),
              const UserInformation(),
              VerticalSpace(40.h),
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
                mainIcon: AppAssets.orderIcon,
                title: AppStrings.orders,
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
              // VerticalSpace(40.h),
              // Align(
              //     alignment: AlignmentDirectional.topStart,
              //     child: Text(AppStrings.settings,
              //         style: TextStyle(
              //             fontSize: 14.sp,
              //             fontWeight: FontWeight.w700,
              //             color: AppColors.smallTextBlackColor))),
              // VerticalSpace(25.h),
              // OptionItem(
              //   mainIcon: AppAssets.languageIcon,
              //   title: AppStrings.languages,
              //   optionalData: Text(AppStrings.selectedLanguage,
              //       style: TextStyle(
              //           color: AppColors.primaryColor,
              //           fontWeight: FontWeight.w700,
              //           fontSize: 13.sp)),
              // ),
              // VerticalSpace(40.h),
              // Align(
              //     alignment: AlignmentDirectional.topStart,
              //     child: Text(AppStrings.contactUs,
              //         style: TextStyle(
              //             fontSize: 14.sp,
              //             fontWeight: FontWeight.w700,
              //             color: AppColors.smallTextBlackColor))),
              // VerticalSpace(25.h),
              // const OptionItem(
              //   mainIcon: AppAssets.callIcon,
              //   title: AppStrings.callUs,
              // ),
              // VerticalSpace(16.h),
              // const OptionItem(
              //   mainIcon: AppAssets.information,
              //   title: AppStrings.aboutUs,
              // ),
              // VerticalSpace(16.h),
              // const OptionItem(
              //   mainIcon: AppAssets.information,
              //   title: AppStrings.termsAndConditions,
              // ),
              // VerticalSpace(16.h),
              // const OptionItem(
              //   mainIcon: AppAssets.information,
              //   title: AppStrings.privacyPolicy,
              // ),
              // VerticalSpace(33.h),
            ],
          ),
        ),
      ),
    );
  }
}
