import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_or_continue_column.dart';

import '../../../../core/utils/app_routes.dart';

class SignUpOrLoginPage extends StatelessWidget {
  const SignUpOrLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: AuthenticationLogo()),
            VerticalSpace(context.height * 0.055),
            const LoginOrContinueColumn(),
            VerticalSpace(context.height * 0.11),

            /// Sign Up Button
            PrimaryButton(
              content: Text(
                AppStrings.signUpEn,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              onTap: () => Routes.signUpRoute.moveTo,
            ),
            VerticalSpace(context.height * 0.033),

            /// Login Button
            PrimaryOutlinedButton(
              text: AppStrings.loginEn,
              onTap: () => Routes.loginRoute.moveTo,
            )
          ],
        ),
      ),
    );
  }
}
