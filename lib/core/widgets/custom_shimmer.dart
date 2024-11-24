import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key, this.radius, this.height, this.width});
  final double? radius, height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.height12, horizontal: context.width8),
            child: Container(
                height: height ?? 173,
                width: width ?? double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        radius ?? context.height * 0.0065)))));
  }
}