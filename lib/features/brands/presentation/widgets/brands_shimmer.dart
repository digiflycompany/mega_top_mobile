import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_shimmer.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.height12, horizontal: context.width8),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h),
            itemBuilder: (_, i) {
              return CustomShimmer();
            }));
  }
}