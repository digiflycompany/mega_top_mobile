import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_screen_widgets/edit_email_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_screen_widgets/edit_full_name_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_screen_widgets/edit_phone_text_field.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_profile_screen_widgets/edit_profile_details_shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                return Column(
                  children: [
                    EditEmailTextField(
                      title: AppLocalizations.of(context)!.email,
                      controller: cubit.emailController,
                    ),
                    EditFullNameTextField(
                      title: AppLocalizations.of(context)!.fullName,
                      controller: cubit.fullNameController,
                    ),
                    EditPhoneTextField(
                      title: AppLocalizations.of(context)!.phoneNumber,
                      controller: cubit.phoneController,
                    ),
                  ],
                );
              } else if (state is AccountDetailsFailure) {
                cubit.showErrorToast(context, AppStrings.profileDetailsFailed, state.error);
                return Center(child: Text('Failed'),);
              } else if(state is UpdatingAccountDetailsLoading){
                return EditProfileDetailsShimmer();
              }else if(state is UpdatingAccountDetailsSuccess){
                cubit.savedSuccessToast(context,AppStrings.savedSuccessfully);
                return Column(
                  children: [
                    EditEmailTextField(
                      title: AppLocalizations.of(context)!.email,
                      controller: cubit.emailController,
                    ),
                    EditFullNameTextField(
                      title: AppLocalizations.of(context)!.fullName,
                      controller: cubit.fullNameController,
                    ),
                    EditPhoneTextField(
                      title: AppLocalizations.of(context)!.phoneNumber,
                      controller: cubit.phoneController,
                    ),
                  ],
                );
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
