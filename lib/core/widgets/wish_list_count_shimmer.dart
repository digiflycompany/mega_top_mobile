import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:shimmer/shimmer.dart';

class WishListCountShimmer extends StatelessWidget {
  const WishListCountShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(bottom: context.height*0.035),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 14.sp,
              color: Colors.grey[300],
            ),
            const Spacer(),
            Container(
              width: 20.w,
              height: 14.sp,
              color: Colors.grey[300],
            ),
            HorizontalSpace(context.width * 0.011),
            Container(
              width: 50.w,
              height: 14.sp,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}