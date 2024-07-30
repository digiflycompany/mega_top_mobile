import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/wish_list_count_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ProductsListShimmer extends StatelessWidget {
  const ProductsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(top: context.height*0.04),
        child: Column(
          children: [
            WishListCountShimmer(),
            Padding(
              padding: EdgeInsets.only(bottom: context.height*0.027,top: context.height*0.006),
              child: Container(
                width: double.infinity,
                height: context.height*0.145,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.height * 0.0065),
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
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.height*0.027,top: context.height*0.006),
              child: Container(
                width: double.infinity,
                height: context.height*0.145,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.height * 0.0065),
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
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.height*0.027,top: context.height*0.006),
              child: Container(
                width: double.infinity,
                height: context.height*0.145,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.height * 0.0065),
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
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.height*0.027,top: context.height*0.006),
              child: Container(
                width: double.infinity,
                height: context.height*0.145,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.height * 0.0065),
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
            ),
          ],
        ),
      ),
    );
  }
}