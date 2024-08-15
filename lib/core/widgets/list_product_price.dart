import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';

class ListProductPrice extends StatelessWidget {
  final String? text;
  const ListProductPrice({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text!,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
