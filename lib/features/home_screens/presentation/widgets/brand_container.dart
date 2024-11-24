import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_cached_network_image.dart';
import 'package:mega_top_mobile/features/brands/data/models/brands_response.dart';
import 'package:shimmer/shimmer.dart';

class BrandContainer extends StatelessWidget {
  final Brand brand;
  final Function? onTap;
  const BrandContainer({super.key, this.onTap, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
            width: 72.h,
            height: 72.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.containerShadow,
                      offset: Offset(0, 2),
                      blurRadius: 12)
                ]),
            child: CustomCachedNetworkImage(url: brand.image ?? '')));
  }
}

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.height12, horizontal: context.width8),
            child: Container(
                width: context.width * 0.707,
                height: context.height *
                    0.4, // Adjust to match the original container's height
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(context.height * 0.0065)))));
  }
}