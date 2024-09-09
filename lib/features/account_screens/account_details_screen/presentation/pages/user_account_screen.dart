import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/about_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_screen_headline.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/call_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/compare_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/language_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/notification_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/order_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/profile_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/shipping_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/sign_out_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/user_information.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/wish_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: CustomFavouriteAppBar(AppLocalizations.of(context)!.account)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const UserInformation(),
              AccountScreenHeadline(text: AppLocalizations.of(context)!.account),
              const OrderItem(),
              const WishListItem(),
              const NotificationItem(),
              const ShippingItem(),
              const CompareItem(),
              AccountScreenHeadline(text: AppLocalizations.of(context)!.settings),
              const ProfileItem(),
              const LanguageItem(),
              AccountScreenHeadline(text: AppLocalizations.of(context)!.contactUs),
              const CallUsItem(),
              const AboutUsItem(),
              //TermsAndConditionsItem(),
              //PrivacyPolicyItem(),
              const SignOutItem(),
            ],
          ),
        ),
      ),
    );
  }
}
