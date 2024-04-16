import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state is DeleteAccountSuccess){
          PreferencesHelper.logOut();
          Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
        }
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, context.height * 0.089),
              child: const PrimaryAppBar(
                AppStrings.deleteAccount,
                favour: false,
              )),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.066),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(48.h),
                EditTextField(
                  title: AppStrings.emailEn,
                  text: PreferencesHelper.getEmail,
                ),
                VerticalSpace(48.h),
                const Text(
                  AppStrings.passwordEn,
                  style: TextStyle(color: AppColors.greyTextColor),
                ),
                const PasswordTextField(),
              ],
            ),
          ),
          bottomNavigationBar: ButtonBottomNavBar(
            button: state is DeleteAccountLoading?Center(
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: AppColors.red,
                  ),
                ),
                child: CircularProgressIndicator.adaptive(),
              ),
            ):PrimaryOutlinedButton(
              onTap: () {
                cubit.deleteAccount(PreferencesHelper.getEmail, PreferencesHelper.getID!);
              },
              borderColor: AppColors.red,
              text: AppStrings.deleteAccount,
              textColor: AppColors.red,
            ),
          ),
        );
      },
    );
  }
}
