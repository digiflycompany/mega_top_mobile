import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_password_screen_widgets/edit_password_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_password_screen_widgets/update_password_shimmer.dart';

class NewPasswordTextFieldItem extends StatelessWidget {
  const NewPasswordTextFieldItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
      builder: (context, state) {
        AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 48.h),
          child: state is UpdatingPasswordLoading?UpdatePasswordShimmer():EditPasswordTextField(
            title: AppStrings.newPassword,
            controller: cubit.newPasswordController,
          ),
        );
      },
    );
  }
}
