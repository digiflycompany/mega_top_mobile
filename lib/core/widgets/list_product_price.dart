import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';

class ListProductPrice extends StatelessWidget {
  final String? text;
  const ListProductPrice({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text!,
        style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
