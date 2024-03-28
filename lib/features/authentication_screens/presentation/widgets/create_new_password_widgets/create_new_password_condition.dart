import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forget_password_custom_icon.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_divider.dart';

class CreateNewPasswordCondition extends StatelessWidget {
  const CreateNewPasswordCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.055,bottom: context.height * 0.06),
      child:  Row(
        children: [
          const ForgotPasswordIcon(
            color: AppColors.primaryColor,
            icon: AppAssets.checkIcon,
          ),
          const ForgotPasswordDivider(
            color: AppColors.primaryColor,
          ),
          const ForgotPasswordIcon(
            color: AppColors.primaryColor,
            icon: AppAssets.checkIcon,
          ),
          const ForgotPasswordDivider(
            color: AppColors.primaryColor,
          ),
          BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              AuthenticationCubit authenticationCubit = context.read<AuthenticationCubit>();
              return ForgotPasswordIcon(
                color: AppColors.primaryColor,
                icon: authenticationCubit.newPasswordSuccess
                    ? AppAssets.checkIcon
                    : AppAssets.newPasswordWhiteIcon,
              );
            },
          ),
        ],
      ),
    );
  }
}
