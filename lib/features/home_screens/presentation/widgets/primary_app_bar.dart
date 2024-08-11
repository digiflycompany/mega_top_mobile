import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_back_icon.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/small_circular_progress_indicator.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'customer_icon.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar(this.text, {super.key, this.favour = true, this.onTap});

  final String text;
  final bool favour;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.height * 0.087,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowAppBarColor,
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            AppBarBackArrow(
              onTap: () {
                if (onTap != null) {
                  onTap!();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            HorizontalSpace(context.width * 0.022),
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.008),
              child: TitleText(text: text),
            ),
            const Spacer(),
            FutureBuilder<String?>(
              future: PreferencesHelper.getToken(),
              builder: (context, snapshot) {
                final token = snapshot.data;
                final isUserLoggedIn = token != null;
                if (isUserLoggedIn && favour) {
                  return BlocProvider(
                    create: (context) => AccountDetailsCubit(AccountDetailsRepoImp())..getAccountDetails(),
                    child: Builder(
                        builder: (context) {
                          final accountDetailsCubit = context.read<AccountDetailsCubit>();
                          return BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
                            builder: (context, state) {
                              return Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: context.width * 0.045),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.wishListPageRoute).then((_) {
                                        accountDetailsCubit.getAccountDetails();
                                      });
                                    },
                                    child:  state is AccountDetailsNoInternetConnection
                                        ? Transform.scale(
                                        scale: 0.35,
                                        child: SvgPicture.asset(AppAssets.noInternetIcon))
                                        : state is AccountDetailsLoading
                                        ? SmallCircularProgressIndicator()
                                        : CustomerIcon(
                                      icon: AppAssets.favouritesIcon,
                                      number: accountDetailsCubit.wishListCount.toString(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
