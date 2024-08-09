import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/about_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_screen_headline.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/call_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/language_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/notification_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/order_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/privacy_policy_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/profile_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/shipping_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/sign_out_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/terms_and_conditions_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/user_information.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/wish_list_item.dart';


class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.accountEn)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: const SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserInformation(),
              AccountScreenHeadline(text: AppStrings.accountEn,),
              OrderItem(),
              WishListItem(),
              NotificationItem(),
              ShippingItem(),
              AccountScreenHeadline(text: AppStrings.settings,),
              ProfileItem(),
              LanguageItem(),
              AccountScreenHeadline(text: AppStrings.contactUs,),
              CallUsItem(),
              AboutUsItem(),
              TermsAndConditionsItem(),
              PrivacyPolicyItem(),
              SignOutItem(),
            ],
          ),
        ),
      ),
    );
  }
}
