import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';

class EditPasswordTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const EditPasswordTextField(
      {super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
      builder: (context, state) {
        AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: AppColors.greyTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp)
            ),
            PasswordTextField(
              controller: controller,
              isPasswordVisible: cubit.isPasswordVisible,
              togglePassword: () => cubit.togglePasswordVisibility(),
              validator: (value) {
                RegExp regExp = new RegExp(cubit.passwordPattern);
                if (value == null || value.isEmpty) {
                  return AppStrings.pleaseEnterYourPassword;
                } else if (!regExp.hasMatch(value)) {
                  return AppStrings.passwordVerification;
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
