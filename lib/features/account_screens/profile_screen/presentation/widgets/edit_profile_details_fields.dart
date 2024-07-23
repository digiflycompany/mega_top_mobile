import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_email_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_full_name_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_phone_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_details_shimmer.dart';

class EditProfileDetailsFields extends StatelessWidget {
  const EditProfileDetailsFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
            builder: (context, state) {
              AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();
              if (state is AccountDetailsLoading) {
                return EditProfileDetailsShimmer();
              } else if (state is AccountDetailsSuccess) {
                final user = state.user.data.user;
                return Column(
                  children: [
                    EditEmailTextField(
                      title: AppStrings.emailEn,
                      text: user.email,
                    ),
                    EditFullNameTextField(
                      title: AppStrings.firstName,
                      text: user.fullName,
                    ),
                    EditPhoneTextField(
                      title: AppStrings.phoneNumberEn,
                      text: user.phoneNumber, // Assuming the last name is the rest
                    ),
                  ],
                );
              } else if (state is AccountDetailsFailure) {
                cubit.showErrorToast(context, AppStrings.profileDetailsFailed, state.error);
                return Center(child: Text('Failed'),);
              } else if (state is AccountDetailsNoInternetConnection) {
                return NoInternetScreen(buttonOnTap: () {
                  cubit.getAccountDetails();
                },);
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
