import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_color.dart';

class WhiteCircleIcon extends StatelessWidget {
  final String? icon;
  const WhiteCircleIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.width * 0.5,
        height: context.height * 0.207,
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
        child: Center(child: SvgPicture.asset(icon!)),
      ),
    );
  }
}
