import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_text_field.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import 'create_account_text.dart';
import 'forgot_password_text.dart';
import 'google_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
      child:  Column(
        children: [
          /// Email Text Field
          const PrimaryTextField(
            hintText: AppStrings.emailEn,
            prefixSvg: AppAssets.emailSecondIcon,
          ),
          VerticalSpace(context.height*0.033),
          /// Password Text Field
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {},
            builder: (context, state) {
              AuthenticationCubit authenticationCubit =context.read<AuthenticationCubit>();
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
          /// Login Button
          PrimaryButton(
            onTap: (){
              Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
            },
            text: AppStrings.loginEn,
          ),
          VerticalSpace(context.height*0.033),
          /// Or Text
          Text(
            AppStrings.orEn,
            style: TextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          VerticalSpace(context.height*0.033),
          const GoogleButton(text: AppStrings.continueWithGoogleEn,),
          VerticalSpace(context.height*0.025),
          const CreateAccountText(),
          VerticalSpace(context.height*0.0045),
        ],
      ),
    );
  }
}
