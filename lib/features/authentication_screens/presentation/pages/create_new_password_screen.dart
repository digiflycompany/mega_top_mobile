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
import '../widgets/success_pop_up.dart';
import 'login_screen.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late AuthenticationCubit authenticationCubit;
    authenticationCubit = context.read<AuthenticationCubit>();
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const CustomAppBar(AppStrings.createNewPasswordEn)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpace(context.height*0.055),
              Row(
                children: [
                  const ForgotPasswordIcon(
                    color: AppColors.primaryColor,
                    icon: AppAssets.checkIcon,
                  ),
                  const ForgotPasswordDivider(color: AppColors.primaryColor,),
                  const ForgotPasswordIcon(
                    color: AppColors.primaryColor,
                    icon: AppAssets.checkIcon,
                  ),
                  const ForgotPasswordDivider(color: AppColors.primaryColor,),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                     builder: (context, state) {
                     return ForgotPasswordIcon(
                    color: AppColors.primaryColor,
                    icon: authenticationCubit.newPasswordSuccess?AppAssets.checkIcon:AppAssets.newPasswordWhiteIcon,
                  );
                      },
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
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
               builder: (context, state) {
               return PrimaryButton(
                text: AppStrings.confirmPasswordEn,
                onTap: (){
                  authenticationCubit.passwordSuccess();
                  authenticationCubit.passwordChangedSuccessfully(context);
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
  void passwordChangedSuccessfully(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const NewPasswordPopUp();
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      //Routes.loginRoute.moveToAndRemoveCurrent;
    });
  }
}
