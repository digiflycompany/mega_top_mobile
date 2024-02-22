import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/about_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/call_us_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/compare_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/language_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/notification_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/order_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/profile_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/saved_card_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/shipping_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/terms_and_conditions_item.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/user_information.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/wish_list_item.dart';

import '../widgets/privacy_policy_item.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.accountEn)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpace(25.h),
              const UserInformation(),
              VerticalSpace(40.h),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    AppStrings.accountEn,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.smallTextBlackColor),
                  )),
              VerticalSpace(25.h),
              const OrderItem(),
              VerticalSpace(16.h),
              WishListItem(
                onTap: ()=> Routes.wishListPageRoute.moveTo,
              ),
              VerticalSpace(16.h),
              NotificationItem(
                onTap: ()=> Routes.notificationPageRoute.moveTo,
              ),
              VerticalSpace(16.h),
              ShippingItem(onTap: () {
                Routes.addNewAddressPageRoute.moveTo;
              }),
              VerticalSpace(16.h),
              const SavedCardItem(),
              VerticalSpace(16.h),
              const CompareItem(),
              VerticalSpace(40.h),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(AppStrings.settings,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.smallTextBlackColor))),
              VerticalSpace(25.h),
              ProfileItem(onTap: () {
                Routes.profilePageRoute.moveTo;
              }),
              VerticalSpace(25.h),
              const LanguageItem(),
              VerticalSpace(40.h),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(AppStrings.contactUs,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.smallTextBlackColor))),
              VerticalSpace(25.h),
              const CallUsItem(),
              VerticalSpace(16.h),
              const AboutUsItem(),
              VerticalSpace(16.h),
              const TermsAndConditionsItem(),
              VerticalSpace(16.h),
              const PrivacyPolicyItem(),
              VerticalSpace(33.h),
            ],
          ),
        ),
      ),
    );
  }
}
