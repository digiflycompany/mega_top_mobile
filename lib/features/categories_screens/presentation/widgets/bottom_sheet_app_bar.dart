import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar(  this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height*0.087,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowAppBarColor,
            offset: Offset(0.0, 4.0), // Offset to control the shadow position
            blurRadius: 4.0, // Spread of the shadow
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Row(
          children: [
           Text(
             text,
           style: const TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.w700,
             fontSize: 16
           ),
           ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width:context.width*0.09,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.circleAvatarBackground,
                ),
                child: Center(
                  child: SvgPicture.asset(AppAssets.closeIcon),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
