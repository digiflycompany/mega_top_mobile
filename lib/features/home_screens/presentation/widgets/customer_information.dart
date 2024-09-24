import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_icon.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomerInformation extends StatelessWidget {
  const CustomerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: PreferencesHelper.getToken(),
        builder: (context, snapshot) {
          final token = snapshot.data;
          final isUserLoggedIn = token != null;
          return Padding(
              padding: EdgeInsets.symmetric(vertical: context.height * 0.0165),
              child: Row(children: [
                HorizontalSpace(context.width * 0.022),
                CustomerName(
                  name: isUserLoggedIn
                      ? PreferencesHelper.getUserModel?.data?.user?.fullName
                      : AppLocalizations.of(context)!.visitor,
                ),
                const Spacer(),
                if (isUserLoggedIn)
                  BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
                      builder: (context, state) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.wishListPageRoute)
                              .then((_) {
                            context
                                .read<AccountDetailsCubit>()
                                .getAccountDetails();
                          });
                        },
                        child: CustomerIcon(
                            icon: AppAssets.favouritesIcon,
                            number: PreferencesHelper.getWishListCount()
                                .toString()));
                  }),
                HorizontalSpace(context.width * 0.022),
                if (isUserLoggedIn)
                  GestureDetector(
                      onTap: () => Routes.notificationPageRoute.moveTo(),
                      child: CustomerIcon(
                          icon: AppAssets.notificationIcon,
                          number: PreferencesHelper.getNotificationCount()
                              .toString()))
              ]));
        });
  }
}