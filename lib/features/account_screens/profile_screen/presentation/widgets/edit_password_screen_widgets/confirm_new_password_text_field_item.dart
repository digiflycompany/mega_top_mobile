import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_password_screen_widgets/update_password_shimmer.dart';

class ConfirmNewPasswordTextFieldItem extends StatelessWidget {
  const ConfirmNewPasswordTextFieldItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
      builder: (context, state) {
        AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state is UpdatingPasswordLoading?UpdatePasswordShimmer():Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.confirmNewPassword,
                    style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp)
                ),
                PasswordTextField(
                  controller: cubit.confirmNewPasswordController,
                  isPasswordVisible: cubit.isPasswordVisible,
                  togglePassword: () => cubit.togglePasswordVisibility(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseConfirmYourPassword;
                    } else if (cubit.confirmNewPasswordController.text != cubit.newPasswordController.text) {
                      return AppStrings.passwordsNotMatching;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
