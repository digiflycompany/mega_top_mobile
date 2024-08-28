import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/list_product_price.dart';
import 'package:mega_top_mobile/core/widgets/product_photo_list_view.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/checkout_list_product_name.dart';

class YourOrderListContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productPrice;

  const YourOrderListContainer({
    super.key,
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
        border: Border.all(color: AppColors.circleAvatarBackground, width: 1.w),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: context.width * 0.022,
              end: context.width * 0.045,
              top: context.height * 0.012,
              bottom: context.height * 0.012,
            ),
            child: Stack(
              children: [
                ProductPhotoListView(
                  photo: productPhoto,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                end: context.width * 0.045,
                top: context.height * 0.025,
                bottom: context.height * 0.025,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CheckoutListProductName(
                          text: productName,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ListProductPrice(
                          text: productPrice,
                        ),
                      ),
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
