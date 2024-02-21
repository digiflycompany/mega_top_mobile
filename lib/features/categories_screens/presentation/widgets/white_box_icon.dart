import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_color.dart';

class WhiteBoxIcon extends StatelessWidget {
  final String? icon;
  final Function()? onTap;
  const WhiteBoxIcon({super.key, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.11,
        height: context.height * 0.055,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.height * 0.006),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                offset: Offset(0, 2),
                blurRadius: 12,
                spreadRadius: 0,
              ),
            ]),
        child: Center(
          child: SvgPicture.asset(
            icon!,
            width: context.width * 0.055,
          ),
        ),
      ),
    );
  }
}
