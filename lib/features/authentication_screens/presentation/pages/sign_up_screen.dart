import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import '../../../../core/utils/app_assets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    super.initState();
    authenticationCubit = context.read<AuthenticationCubit>();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                      const AuthenticationTitle(text: AppStrings.createNewAccountEn,),
                      VerticalSpace(context.height*0.055),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
                        child:  Column(
                          children: [
                            const PrimaryTextField(
                              hintText: AppStrings.usernameEn,
                              prefixSvg: AppAssets.usernameIcon,
                            ),
                            VerticalSpace(context.height*0.033),
                            const PrimaryTextField(
                              hintText: AppStrings.emailEn,
                              prefixSvg: AppAssets.emailSecondIcon,
                            ),
                            VerticalSpace(context.height*0.033),
                            PasswordTextField(
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
                            ),
                            VerticalSpace(context.height*0.033),
                            PasswordTextField(
                              hintText: AppStrings.confirmPasswordEn,
                              prefixSvg: AppAssets.passwordIcon,
                              obscure: authenticationCubit.isPasswordVisible,
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  authenticationCubit.togglePasswordVisibility();
                                },
                                child: authenticationCubit.isPasswordVisible?SvgPicture.asset(AppAssets.showPasswordIcon,width: context.width*0.063 , fit: BoxFit.scaleDown,):
                                SvgPicture.asset(AppAssets.hidePasswordIcon,width: context.width*0.063 , fit: BoxFit.scaleDown,),
                              ),
                            ),
                            VerticalSpace(context.height*0.055),
                            const PrimaryButton(
                              text: AppStrings.signUpEn,
                            ),
                            VerticalSpace(context.height*0.065),
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
            )
        );
      },
    );
  }
}
