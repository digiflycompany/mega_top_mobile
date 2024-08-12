import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/title_app_bar.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_icon.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class CustomFavouriteAppBar extends StatelessWidget {
  const CustomFavouriteAppBar(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowAppBarColor,
            offset: Offset(0.0, 4.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(top: context.height * 0.008),
          child: TitleText(text: text),
        ),
        centerTitle: true,
        actions: [
          FutureBuilder<String?>(
            future: PreferencesHelper.getToken(),
            builder: (context, snapshot) {
              final token = snapshot.data;
              final isUserLoggedIn = token != null;
              if (isUserLoggedIn) {
                return Builder(
                  builder: (context) {
                        return Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: context.width * 0.045),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, Routes.wishListPageRoute).then((_) {
                                //   accountDetailsCubit.getAccountDetails();
                                // });
                              },
                              child:
                              // state is AccountDetailsNoInternetConnection
                              //     ? Transform.scale(
                              //     scale: 0.35,
                              //     child: SvgPicture.asset(AppAssets.noInternetIcon))
                              //     : state is AccountDetailsLoading
                              //     ? SmallCircularProgressIndicator()
                              //     :
                              CustomerIcon(
                                icon: AppAssets.favouritesIcon,
                                //number: accountDetailsCubit.wishListCount.toString(),
                                number: PreferencesHelper.getWishListCount().toString(),
                              ),
                            ),
                          ),
                        );
                  }
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
