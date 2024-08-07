import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:shimmer/shimmer.dart';

class ShippingAddressesListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.width * 0.045),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: context.height * 0.23,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.smallContainerGreyColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.045,
                  vertical: context.height * 0.022,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.width * 0.5,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Divider(
                      thickness: 1.w,
                      color: AppColors.onboardingBackgroundColor,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Container(
                      width: context.width * 0.8,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Container(
                      width: context.width * 0.6,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.width * 0.045),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: context.height * 0.23,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.smallContainerGreyColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.045,
                  vertical: context.height * 0.022,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.width * 0.5,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Divider(
                      thickness: 1.w,
                      color: AppColors.onboardingBackgroundColor,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Container(
                      width: context.width * 0.8,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Container(
                      width: context.width * 0.6,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.width * 0.045),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: context.height * 0.23,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.smallContainerGreyColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.045,
                  vertical: context.height * 0.022,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.width * 0.5,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Divider(
                      thickness: 1.w,
                      color: AppColors.onboardingBackgroundColor,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Container(
                      width: context.width * 0.8,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                    VerticalSpace(context.height * 0.0165),
                    Container(
                      width: context.width * 0.6,
                      height: context.height * 0.03,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}