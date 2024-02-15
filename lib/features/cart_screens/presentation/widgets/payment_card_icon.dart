import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';

class PaymentCardIcon extends StatelessWidget {
  final String? icon;
  const PaymentCardIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: context.width*0.11,
      height: context.height*0.055,
      decoration: BoxDecoration(
        color: AppColors.iconsBackgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(child: SvgPicture.asset(icon!)),
    );
  }
}
