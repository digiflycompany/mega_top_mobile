import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteAccountItem extends StatelessWidget {
  const DeleteAccountItem({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountDetailsCubit(AccountDetailsRepoImp()),
      child: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: context.height24),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () =>
                  context.read<AccountDetailsCubit>()
                      .showRemoveAccountBottomSheet(context),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.removeAccountIcon),
                  HorizontalSpace(8.w),
                  Text(AppLocalizations.of(context)!.removeAccount,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
