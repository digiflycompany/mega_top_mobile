import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_assets.dart';
class AppBarBackArrow extends StatelessWidget {
  final Function()? onTap;
  const AppBarBackArrow({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding:  EdgeInsets.only(left: context.width*0.045,top: context.height*0.01,bottom: context.height*0.01),
        child: Container(
          width: context.width*0.12,
          height: context.height*0.056,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child:Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(AppAssets.backArrowEn)),
        ),
      ),
    );
  }
}
