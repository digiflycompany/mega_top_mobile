import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_icon.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_name.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_photo.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class CustomerInformation extends StatelessWidget {
  const CustomerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        String token = PreferencesHelper.getToken() ?? '';
        bool isUserLoggedIn = token.isNotEmpty;
        return Padding(
            padding: EdgeInsets.symmetric(vertical: context.height * 0.0165),
            child: Row(
              children: [
                const CustomerPhoto(
                  photo: AppAssets.customerProfilePhoto,
                ),
                HorizontalSpace(context.width * 0.022),
                CustomerName(
                  //name: AppStrings.userName,
                  //name: !PreferencesHelper.getIsVisitor?'${PreferencesHelper.getName}':'',
                  //name: (PreferencesHelper.getToken()!.isNotEmpty) ? PreferencesHelper.getName : '',
                  name: isUserLoggedIn ? PreferencesHelper.getName : '',
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Routes.wishListPageRoute.moveTo,
                  child: const CustomerIcon(
                    icon: AppAssets.favouritesIcon,
                    number: AppStrings.twelve,
                  ),
                ),
                HorizontalSpace(context.width * 0.022),
                GestureDetector(
                  onTap: () => Routes.notificationPageRoute.moveTo,
                  child: const CustomerIcon(
                    icon: AppAssets.notificationIcon,
                    number: AppStrings.fourteen,
                  ),
                ),
              ],
            ),
          );
      },
    );
  }
}
