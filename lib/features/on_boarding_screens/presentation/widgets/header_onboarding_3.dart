import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/back_arrow_icon.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/curved_container.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/skip_text.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

import '../../../../core/utils/app_assets.dart';

class ThirdHeader extends StatelessWidget {
  final PageController pageController;
  const ThirdHeader({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// BackGroundImage ///
        const CurvedContainer(),
        Padding(
          padding: EdgeInsets.only(top: context.height * 0.12),
          child: Transform.scale(
              scale: 0.7, child: Image.asset(AppAssets.onBoardingBox)),
        ),

        /// Skip Text ///
        SkipText(
          onTap: () {
            Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
            PreferencesHelper.setHasSeenOnboarding(true);
            PreferencesHelper.saveIsVisitor(isVisitor: true);
          },
        ),

        /// Back Arrow ///
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsets.only(
                top: context.width * 0.12, left: context.width * 0.045),
            child: BackArrow(
              onTap: () {
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
