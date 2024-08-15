import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_icon.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_name.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

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
          child: Row(
            children: [
              HorizontalSpace(context.width * 0.022),
              CustomerName(
                name: isUserLoggedIn ? PreferencesHelper.getName : 'Visitor',
              ),
              const Spacer(),
              if (isUserLoggedIn)
                GestureDetector(
                  onTap: () => Routes.wishListPageRoute.moveTo(),
                  child: const CustomerIcon(
                    icon: AppAssets.favouritesIcon,
                    number: AppStrings.zero,
                  ),
                ),
              HorizontalSpace(context.width * 0.022),
              if(isUserLoggedIn)
                GestureDetector(
                 onTap: () => Routes.notificationPageRoute.moveTo(),
                 child: const CustomerIcon(
                  icon: AppAssets.notificationIcon,
                  number: AppStrings.three,
                 ),
                ),
            ],
          ),
        );
      },
    );
  }
}
