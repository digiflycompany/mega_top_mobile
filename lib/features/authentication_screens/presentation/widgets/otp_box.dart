import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class OtpBox extends StatelessWidget {
  final String? number;
  const OtpBox({super.key, this.number});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: context.width*0.134,
      height: context.height*0.065,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.otpBoxColor,
          border: Border.all(color: AppColors.otpBoxBorderColor,width: context.width*0.002)
      ),
      child:  Center(
        child: Text(
          number!,
          style:  TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight:FontWeight.w400
          ),
        ),
      ),
    );
  }
}
