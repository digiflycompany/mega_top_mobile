import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/curved_container.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/skip_text.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_routes.dart';

class FirstHeader extends StatelessWidget {
  final PageController pageController;
  const FirstHeader({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// BackGroundImage ///
        const CurvedContainer(),

        /// Purple Search Icon ///
        Padding(
          padding: EdgeInsets.only(top: context.height * 0.125),
          child: Transform.scale(
              scale: 0.96,
              child: Image.asset(
                AppAssets.searchPurpleIcon,
              )),
        ),

        /// Camera Image ///
        Padding(
          padding: EdgeInsets.only(
              top: context.height * 0.23, right: context.width * 0.6),
          child: Transform.scale(
              scale: 0.4, child: Image.asset(AppAssets.cameraIcon)),
        ),

        /// HardDisk Image ///
        Padding(
          padding: EdgeInsets.only(
              top: context.height * 0.19, left: context.width * 0.52),
          child: Transform.scale(
              scale: 0.3, child: Image.asset(AppAssets.hardDiskIcon)),
        ),

        /// CPU Image ///
        Padding(
          padding: EdgeInsets.only(
              top: context.height * 0.065, right: context.width * 0.52),
          child: Transform.scale(
              scale: 0.37, child: Image.asset(AppAssets.cpuIcon)),
        ),

        /// Skip Text ///
        SkipText(
          onTap: () {
            Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
          },
        ),
      ],
    );
  }
}
