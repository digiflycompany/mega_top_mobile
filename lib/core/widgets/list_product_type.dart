import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';

class ListProductType extends StatelessWidget {
  final String? text;
  const ListProductType({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text!,
        style: TextStyle(
            color: AppColors.greyTextColor,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            fontSize: 10.sp),
      ),
    );
  }
}
