import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';

class BackArrow extends StatelessWidget {
  final Function()? onTap;
  const BackArrow({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap:onTap,
      child: Container(
        width: context.width*0.12,
        height: context.height*0.056,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              offset: Offset(0, 4),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child:Transform.scale(
            scale: 0.53,
            child: SvgPicture.asset(AppAssets.backArrowEn)),
      ),
    );
  }
}
