import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateUserDetailsButton extends StatelessWidget {
  const UpdateUserDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBottomNavBar(
      button: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
        builder: (context, state) {
          AccountDetailsCubit cubit =context.read<AccountDetailsCubit>();
          return PrimaryButton(
            content: state is UpdatingAccountDetailsLoading?const ButtonCircularProgress():Text(
              AppLocalizations.of(context)!.save,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            onTap: state is UpdatingAccountDetailsLoading?(){}:() {
              cubit.updateAccountDetails(cubit.emailController.text, cubit.fullNameController.text, cubit.phoneController.text);
            },
          );
        },
      ),
    );
  }
}
