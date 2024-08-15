import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class OrderDetailedCardShimmer extends StatelessWidget {
  const OrderDetailedCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: context.height152,
            margin: EdgeInsets.only(bottom: context.height16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.containerShadow,
                  offset: Offset(0, 2),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderSmallDetailedCardShimmer extends StatelessWidget {
  const OrderSmallDetailedCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: context.height64,
        margin: EdgeInsets.only(bottom: context.height16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.containerShadow,
              offset: Offset(0, 2),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
      ),
    );
  }
}


class ShimmerCardColumn extends StatelessWidget {
  const ShimmerCardColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Column(
        children: [
          OrderSmallDetailedCardShimmer(),
          VerticalSpace(10.h),
          OrderDetailedCardShimmer(),
          VerticalSpace(10.h),
          OrderDetailedCardShimmer(),
          VerticalSpace(10.h),
          OrderDetailedCardShimmer()
        ],
      ),
    );
  }
}
