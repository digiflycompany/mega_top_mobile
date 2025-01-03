import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key, this.mainIcon, this.title, this.optionalData});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
      builder: (context, state) {
        return AccountOptionItem(
          mainIcon: mainIcon ?? AppAssets.favourFilledIcon,
          title: title ?? AppLocalizations.of(context)!.wishList,
          onTap: () {
            Navigator.pushNamed(context, Routes.wishListPageRoute).then((
                _) {
              context.read<AccountDetailsCubit>().getAccountDetails();
            });
          },
          optionalData: optionalData ??
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.iconsBackgroundColor,
                ),
                width: 24.h,
                height: 24.h,
                child: Center(
                  child: Text(
                    PreferencesHelper.getWishListCount().toString(),
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
        );
      },
    );
  }
}
