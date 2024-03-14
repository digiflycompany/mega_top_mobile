import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.deleteAccount,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.066),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(48.h),
            const EditTextField(
              title: AppStrings.emailEn,
              text: "mohamed.nashaat7733@gmail.com",
            ),
            VerticalSpace(48.h),
            const Text(
              AppStrings.passwordEn,
              style: TextStyle(color: AppColors.greyTextColor),
            ),
            const PasswordTextField(),
          ],
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: PrimaryOutlinedButton(
          onTap: () {
            Navigator.pop(context);
          },
          borderColor: AppColors.red,
          text: AppStrings.deleteAccount,
          textColor: AppColors.red,
        ),
      ),
    );
  }
}
