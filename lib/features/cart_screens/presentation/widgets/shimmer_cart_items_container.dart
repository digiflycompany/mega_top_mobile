import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class ShimmerCartItemsContainer extends StatelessWidget {
  const ShimmerCartItemsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: context.height * 0.165,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.height * 0.0065),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.width * 0.022,
                right: context.width * 0.04,
                top: context.height * 0.012,
                bottom: context.height * 0.012,
              ),
              child: Container(
                width: context.width * 0.2,
                height: context.height * 0.14,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: context.width * 0.026,
                  top: context.height * 0.03,
                  bottom: context.height * 0.022,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.width * 0.5,
                      height: context.height * 0.02,
                      color: Colors.white,
                    ),
                    SizedBox(height: context.height * 0.01),
                    Container(
                      width: context.width * 0.3,
                      height: context.height * 0.02,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: context.width * 0.1,
                          height: context.height * 0.02,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Container(
                          width: context.width * 0.1,
                          height: context.height * 0.02,
                          color: Colors.white,
                        ),
                        SizedBox(width: context.width * 0.04),
                        Container(
                          width: context.width * 0.1,
                          height: context.height * 0.02,
                          color: Colors.white,
                        ),
                        SizedBox(width: context.width * 0.04),
                        Container(
                          width: context.width * 0.1,
                          height: context.height * 0.02,
                          color: Colors.white,
                        ),
                      ],
                    )
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
