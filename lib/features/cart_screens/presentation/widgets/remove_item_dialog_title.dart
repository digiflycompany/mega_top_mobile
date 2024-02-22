import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

class RemoveItemDialogTitle extends StatelessWidget {
  const RemoveItemDialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:context.height*0.087,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow:
        [
          BoxShadow(
            color: AppColors.circleShadow,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.066),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            AppStrings.removeItem,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp
            ),
          ),
        ),
      ),
    );
  }
}
