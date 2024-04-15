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
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/about_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/call_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/language_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/notification_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/privacy_policy_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/terms_and_conditions_item.dart';

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
                  Routes.signUpRoute.moveTo;
                },
              ),
              VerticalSpace(24.h),
              PrimaryOutlinedButton(
                text: AppStrings.loginEn,
                onTap: ()=> Routes.loginRoute.moveTo,
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
              NotificationItem(
                onTap: ()=> Routes.notificationPageRoute.moveTo,
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
              const LanguageItem(),
              VerticalSpace(40.h),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(AppStrings.contactUs,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.smallTextBlackColor))),
              VerticalSpace(25.h),
              const CallUsItem(),
              VerticalSpace(16.h),
              const AboutUsItem(),
              VerticalSpace(16.h),
              const TermsAndConditionsItem(),
              VerticalSpace(16.h),
              const PrivacyPolicyItem(),
              VerticalSpace(33.h),
            ],
          ),
        ),
      ),
    );
  }
}
