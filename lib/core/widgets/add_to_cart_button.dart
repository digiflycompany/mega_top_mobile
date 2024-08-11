import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class AddToCartButton extends StatelessWidget {
  final Function()? onTap;
  final Widget content;
  const AddToCartButton({super.key, this.onTap, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(context.height * 0.006)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.cartButtonIcon,
              width: context.width * 0.066,
            ),
            HorizontalSpace(context.width * 0.022),
            content
          ],
        ),
      ),
    );
  }
}
