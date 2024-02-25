import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.passwordSettings,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.066),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(48.h),
            const Text(
              "Current password",
              style: TextStyle(color: AppColors.greyTextColor),
            ),
            const PasswordTextField(),
            VerticalSpace(48.h),
            const Text(
              "New password",
              style: TextStyle(color: AppColors.greyTextColor),
            ),
            const PasswordTextField(),
            VerticalSpace(48.h),
            const Text(
              "Confirm new password",
              style: TextStyle(color: AppColors.greyTextColor),
            ),
            const PasswordTextField(),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: PrimaryButton(
          text: "Save",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}