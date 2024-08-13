import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_color.dart';

class BasketContainer extends StatelessWidget {
  final Function()? onTap;
  const BasketContainer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.09,
        height: context.height * 0.044,
        decoration: const BoxDecoration(
            color: AppColors.iconsBackgroundColor, shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.015,
              vertical: context.height * 0.0075),
          child: SvgPicture.asset(
            AppAssets.basketIcon,
          ),
        ),
      ),
    );
  }
}
