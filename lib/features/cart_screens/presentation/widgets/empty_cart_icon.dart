import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class EmptyCartIcon extends StatelessWidget {
  const EmptyCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.width*0.5,
        height: context.height*0.207,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.circleShadow,
              offset: Offset(0, 0),
              blurRadius: 15,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: context.width*0.088,right: context.width*0.12,top: context.height*0.049,bottom: context.height*0.049),
          child: Center(child: Image.asset(AppAssets.emptyCartImg,)),
        ),
      ),
    );
  }
}
