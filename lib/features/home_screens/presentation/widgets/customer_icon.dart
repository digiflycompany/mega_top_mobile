import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';

class CustomerIcon extends StatelessWidget {
  final String? icon;
  final String? number;
  const CustomerIcon({super.key, this.icon, this.number});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.width*0.131,
          height: context.height*0.062,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.iconsBackgroundColor
          ),
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: context.width*0.022,vertical:context.height*0.015),
            child: SvgPicture.asset(icon!),
          ),
        ),
        Positioned(
          top: context.height*0.013,
          left: context.width*0.067,
          child: Container(
            width:context.width*0.042,
            height:context.height*0.025,
            decoration:  const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.iconsBackgroundColor,
            ),
            child: Center(
              child: Container(
                width:context.width*0.035,
                height:context.height*0.017,
                decoration:  const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.redIconColor,
                ),
                child:  Center(
                  child: Text(
                    number!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 7.5
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
