import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forget_password_custom_icon.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_divider.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../../cubit/auth_state.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late AuthenticationCubit authenticationCubit;
    authenticationCubit = context.read<AuthenticationCubit>();
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.087),
          child: const CustomAppBar(AppStrings.createNewPasswordEn)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpace(context.height*0.055),
              const Row(
                children: [
                  ForgotPasswordIcon(
                    color: AppColors.primaryColor,
                    icon: AppAssets.checkIcon,
                  ),
                  ForgotPasswordDivider(color: AppColors.primaryColor,),
                  ForgotPasswordIcon(
                    color: AppColors.primaryColor,
                    icon: AppAssets.checkIcon,
                  ),
                  ForgotPasswordDivider(color: AppColors.primaryColor,),
                  ForgotPasswordIcon(
                    color: AppColors.primaryColor,
                    icon: AppAssets.newPasswordWhiteIcon,
                  ),
                ],
              ),
              VerticalSpace(context.height*0.06),
              const ForgotPasswordDescription(
                text: AppStrings.createNewPasswordDescriptionEn,
              ),
              VerticalSpace(context.height*0.033),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  return PasswordTextField(
                    hintText: AppStrings.enterYourNewPasswordEn,
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
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  return PasswordTextField(
                    hintText: AppStrings.confirmYourNewPasswordEn,
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
              VerticalSpace(context.height*0.055),
              PrimaryButton(
                text: AppStrings.confirmPasswordEn,
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4))),
                            insetPadding: const EdgeInsets.all(26),
                            scrollable: true,
                            titlePadding: const EdgeInsets.all(0),
                            contentPadding: EdgeInsets.zero,
                            content: Container(
                              height: 295,
                              width: 335,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text('aaaa')
                            ));
                      },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
