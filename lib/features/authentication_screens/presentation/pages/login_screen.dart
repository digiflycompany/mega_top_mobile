import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/google_button.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late AuthenticationCubit authenticationCubit;
    authenticationCubit = context.read<AuthenticationCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        child: Container(
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
                      BlocConsumer<AuthenticationCubit, AuthenticationState>(
                            listener: (context, state) {},
                           builder: (context, state) {
                         return PasswordTextField(
                         hintText: AppStrings.passwordEn,
                        prefixSvg: AppAssets.passwordIcon,
                        obscure: authenticationCubit.isPasswordVisible,
                        suffixIcon: GestureDetector(
                          onTap: (){
                            authenticationCubit.togglePasswordVisibility();
                          },
                          child: authenticationCubit.isPasswordVisible?SvgPicture.asset(AppAssets.showPasswordIcon,width: context.width*0.063 , fit: BoxFit.scaleDown,):
                          SvgPicture.asset(AppAssets.hidePasswordIcon,width: context.width*0.063 , fit: BoxFit.scaleDown,),
                        ),
                      );
                         },
                        ),
                      VerticalSpace(context.height*0.033),
                      ForgotPassword(
                        onTap: (){
                          Routes.resetPasswordRoute.moveTo;
                        },
                      ),
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
                      VerticalSpace(context.height*0.025),
                      RowTextButton(
                        firstText: AppStrings.doNotHaveAccountEn,
                        buttonText: AppStrings.createAccountEn,
                        onTap: (){
                          Routes.signUpRoute.moveTo;
                        },
                      ),
                      VerticalSpace(context.height*0.0045),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
