import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/delete_account_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_password_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_item.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.profile,
            favour: false,
          )),
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
                width: 120.w,
                height: 80.h,
              ),
              VerticalSpace(35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome, ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16.sp)),
                  Text(" Mohamed",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16.sp)),
                ],
              ),
              VerticalSpace(40.h),
              EditProfileItem(onTap: () {
                Routes.profileDetailsPageRoute.moveTo;
              }),
              VerticalSpace(24.h),
              EditPasswordItem(
                onTap: () {
                  Routes.passwordDetailsPageRoute.moveTo;
                },
              ),
              VerticalSpace(24.h),
              DeleteAccountItem(
                onTap: () {
                  Routes.deleteAccountPageRoute.moveTo;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
