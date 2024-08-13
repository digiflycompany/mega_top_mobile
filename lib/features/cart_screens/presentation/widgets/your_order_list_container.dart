import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/list_product_name.dart';
import 'package:mega_top_mobile/core/widgets/list_product_price.dart';
import 'package:mega_top_mobile/core/widgets/product_photo_list_view.dart';

class YourOrderListContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productPrice;
  const YourOrderListContainer(
      {super.key,
      this.productPhoto,
      this.productName,
      this.productPrice,
 });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.165,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          border:
              Border.all(color: AppColors.circleAvatarBackground, width: 1.w)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: context.width * 0.022,
                right: context.width * 0.045,
                top: context.height * 0.012,
                bottom: context.height * 0.012),
            child: Stack(
              children: [
                ProductPhotoListView(
                  photo: productPhoto,
                ),
                // discount == true
                //     ? Padding(
                //         padding: EdgeInsets.symmetric(
                //             vertical: context.height * 0.009,
                //             horizontal: context.width * 0.016),
                //         child: DiscountContainer(
                //           discountPercent: discountPercent,
                //           width: context.width * 0.1,
                //           height: context.height * 0.028,
                //         ),
                //       )
                //     : Container(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: context.width * 0.045,
                  top: context.height * 0.03,
                  bottom: context.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ListProductName(
                        text: productName,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const AvailableContainer(),
                      const Spacer(),
                      ListProductPrice(
                        text: productPrice,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
