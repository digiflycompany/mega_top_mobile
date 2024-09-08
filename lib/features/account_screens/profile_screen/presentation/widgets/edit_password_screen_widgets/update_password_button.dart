import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdatePasswordButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const UpdatePasswordButton({super.key, required this.formKey});

  @override
  State<UpdatePasswordButton> createState() => _UpdatePasswordButtonState();
}

class _UpdatePasswordButtonState extends State<UpdatePasswordButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountDetailsCubit, AccountDetailsState>(
      listener: (context, state)=>context.read<AccountDetailsCubit>().handleEditPasswordStates(context, state),
      builder: (context, state) {
        AccountDetailsCubit cubit = context.read<AccountDetailsCubit>();
        return ButtonBottomNavBar(
          button: PrimaryButton(
            content: state is UpdatingPasswordLoading?const ButtonCircularProgress():Text(
              AppLocalizations.of(context)!.save,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            onTap: state is UpdatingPasswordLoading?(){}:() {
              if(widget.formKey.currentState!.validate()){
                cubit.updatePassword(cubit.newPasswordController.text,context);
              }
            },
          ),
        );
      },
    );
  }
}
