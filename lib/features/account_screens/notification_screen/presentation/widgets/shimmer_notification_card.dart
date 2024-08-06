import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class ShimmerNotificationCard extends StatelessWidget {
  const ShimmerNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(top: context.height*0.016,bottom: context.height*0.016,right: context.width*0.022,left: context.width*0.022),
        child: Column(
          children: [
            VerticalSpace(context.height16),
            Container(
              width: double.infinity,
              height: context.height * 0.34,
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
              child: Padding(
                padding: EdgeInsets.only(
                    right: context.width * 0.022,
                    left: context.width * 0.022,
                    top: context.height * 0.012,
                    bottom: context.height * 0.012),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: context.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    Container(
                      width: context.width * 0.6,
                      height: 20.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: context.height * 0.01),
                    Container(
                      width: double.infinity,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                    const Spacer(),
                    Container(
                      width: context.width * 0.3,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(context.height16),
            Container(
              width: double.infinity,
              height: context.height * 0.34,
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
              child: Padding(
                padding: EdgeInsets.only(
                    right: context.width * 0.022,
                    left: context.width * 0.022,
                    top: context.height * 0.012,
                    bottom: context.height * 0.012),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: context.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    Container(
                      width: context.width * 0.6,
                      height: 20.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: context.height * 0.01),
                    Container(
                      width: double.infinity,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                    const Spacer(),
                    Container(
                      width: context.width * 0.3,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(context.height16),
            Container(
              width: double.infinity,
              height: context.height * 0.34,
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
              child: Padding(
                padding: EdgeInsets.only(
                    right: context.width * 0.022,
                    left: context.width * 0.022,
                    top: context.height * 0.012,
                    bottom: context.height * 0.012),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: context.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    Container(
                      width: context.width * 0.6,
                      height: 20.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: context.height * 0.01),
                    Container(
                      width: double.infinity,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                    const Spacer(),
                    Container(
                      width: context.width * 0.3,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}