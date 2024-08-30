import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_button_text.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RemoveAccountBottomSheetBody extends StatelessWidget {
  const RemoveAccountBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AccountDetailsCubit(AccountDetailsRepoImp()),
  child: BlocConsumer<AccountDetailsCubit, AccountDetailsState>(
      listener: (context, state)=>context.read<AccountDetailsCubit>().handleRemoveAccountStates(context, state),
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width16),
          child: Column(
            children: [
              VerticalSpace(context.height * 0.033),
              Text(AppLocalizations.of(context)!.areYouSureYouWantToRemoveYourAccount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              VerticalSpace(context.height24),
              PrimaryButton(
                content: state is RemoveAccountLoading?ButtonCircularProgress():PrimaryButtonText(
                  text: AppLocalizations.of(context)!.removeAccount,),
                buttonColor: AppColors.red,
                onTap:()=>state is RemoveAccountLoading?{}:context.read<AccountDetailsCubit>().removeAccount(),
              ),
              VerticalSpace(context.height16),
              PrimaryOutlinedButton(
                text: AppLocalizations.of(context)!.cancel,
                borderColor: AppColors.red,
                textColor: AppColors.red,
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        );
      },
    ),
);
  }
}
