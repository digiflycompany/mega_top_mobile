import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:mega_top_mobile/features/profile_screen/presentation/widgets/delete_account_item.dart';
import 'package:mega_top_mobile/features/profile_screen/presentation/widgets/edit_password_item.dart';
import 'package:mega_top_mobile/features/profile_screen/presentation/widgets/edit_profile_item.dart';

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
            const EditProfileItem(),
            VerticalSpace(24.h),
            const EditPasswordItem(),
            VerticalSpace(24.h),
            const DeleteAccountItem(),
          ],
        ),
      ),
    );
  }
}
