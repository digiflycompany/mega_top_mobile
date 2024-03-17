import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_assets.dart';
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
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
      child: Column(
        children: [
          /// Email Text Field
          const PrimaryTextField(
            hintText: AppStrings.emailEn,
            prefixSvg: AppAssets.emailSecondIcon,
          ),
          VerticalSpace(context.height * 0.033),

          /// Password Text Field
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {},
            builder: (context, state) {
              return const PasswordTextField(
                hintText: AppStrings.passwordEn,
                prefixSvg: AppAssets.passwordIcon,
              );
            },
          ),
          VerticalSpace(context.height * 0.033),
          ForgotPassword(
            onTap: () {
              Routes.resetPasswordRoute.moveTo;
            },
          ),
          VerticalSpace(context.height * 0.055),

          /// Login Button
          PrimaryButton(
            onTap: () {
              Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
            },
            text: AppStrings.loginEn,
          ),
          const CreateAccountText(),
        ],
      ),
    );
  }
}
