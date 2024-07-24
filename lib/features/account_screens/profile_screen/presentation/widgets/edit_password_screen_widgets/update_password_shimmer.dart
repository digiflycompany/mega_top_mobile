import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class UpdatePasswordShimmer extends StatelessWidget {
  const UpdatePasswordShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Container(
              width: 120.w,
              height: 16.h,
              color: Colors.white,
            ),
          ),
          Container(
            width: double.infinity,
            height: 50.h,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
