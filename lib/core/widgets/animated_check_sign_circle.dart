import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_assets.dart';
import '../utils/app_color.dart';

class AnimatedCheckSignCircle extends StatelessWidget {
  const AnimatedCheckSignCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.11,
      height: context.height * 0.055,
      decoration: const BoxDecoration(
          color: AppColors.primaryGreenColor, shape: BoxShape.circle),
      child: Center(
          child: SvgPicture.asset(
        AppAssets.checkMediumIcon,
      )),
    );
  }
}
