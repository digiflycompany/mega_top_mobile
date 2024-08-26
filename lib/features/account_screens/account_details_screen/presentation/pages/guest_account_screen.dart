import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/about_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_screen_headline.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/call_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/language_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GuestAccountScreen extends StatelessWidget {
  const GuestAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: CustomFavouriteAppBar(AppLocalizations.of(context)!.account)),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.045,
            vertical: context.height * 0.045),
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
              Text(AppLocalizations.of(context)!.welcomeToMegaTop,
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp)),
              Text(AppLocalizations.of(context)!.loginOrCreateNewAccount,
                  style: TextStyle(fontSize: 12.sp)),
              VerticalSpace(40.h),
              PrimaryButton(
                content: Text(
                  AppLocalizations.of(context)!.signUp,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
                onTap: () {
                  Routes.signUpRoute.moveTo;
                },
              ),
              VerticalSpace(24.h),
              PrimaryOutlinedButton(
                text: AppLocalizations.of(context)!.login,
                onTap: () => Routes.loginRoute.moveTo,
              ),
              VerticalSpace(50.h),
              AccountScreenHeadline(text: AppLocalizations.of(context)!.settings),
              VerticalSpace(25.h),
              const LanguageItem(),
              AccountScreenHeadline(text: AppLocalizations.of(context)!.contactUs),
              const CallUsItem(),
              const AboutUsItem(),
              //const SignOutItem(),
            ],
          ),
        ),
      ),
    );
  }
}
