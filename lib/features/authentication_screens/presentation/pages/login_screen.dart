import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/google_button.dart';
import '../../../../core/utils/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [AppColors.gradientColor, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              VerticalSpace(context.height*0.13),
              const AuthenticationLogo(),
              VerticalSpace(context.height*0.055),
              const AuthenticationTitle(text: AppStrings.loginTitleEn,),
              VerticalSpace(context.height*0.055),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
                child:  Column(
                  children: [
                    const PrimaryTextField(
                      hintText: AppStrings.emailEn,
                      prefixSvg: AppAssets.emailSecondIcon,
                    ),
                    VerticalSpace(context.height*0.033),
                    PasswordTextField(
                      hintText: AppStrings.passwordEn,
                      prefixSvg: AppAssets.passwordIcon,
                      suffixIcon: InkWell(
                        splashColor: Colors.transparent,
                        child: SvgPicture.asset(AppAssets.showPasswordIcon,width: context.width*0.063 , fit: BoxFit.scaleDown,),
                      ),
                    ),
                    VerticalSpace(context.height*0.033),
                    const ForgotPassword(),
                    VerticalSpace(context.height*0.055),
                    const PrimaryButton(
                      text: AppStrings.loginEn,
                    ),
                    VerticalSpace(context.height*0.033),
                    const Text(
                        AppStrings.orEn,
                        style: TextStyle(
                           color: AppColors.greyTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                    ),
                    VerticalSpace(context.height*0.033),
                    const GoogleButton(text: AppStrings.continueWithGoogleEn,),
                    VerticalSpace(context.height*0.032),
                    const RowTextButton(
                      firstText: AppStrings.doNotHaveAccountEn,
                      buttonText: AppStrings.createAccountEn,
                    ),
                    VerticalSpace(context.height*0.01),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
