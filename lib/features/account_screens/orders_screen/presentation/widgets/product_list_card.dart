import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/core/widgets/list_product_name.dart';
import 'package:mega_top_mobile/core/widgets/list_product_price.dart';
import 'package:mega_top_mobile/core/widgets/list_product_type.dart';
import 'package:mega_top_mobile/core/widgets/product_photo_list_view.dart';


class ProductsListCard extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productType;
  final String? productPrice;
  final String? discountPercent;
  final bool? discount;
  final String? icon;
  final Function()? onTap;
  const ProductsListCard(
      {super.key,
        this.productPhoto,
        this.productName,
        this.productType,
        this.productPrice,
        this.discount = false,
        this.discountPercent,
        this.icon = AppAssets.favourOutlinedIcon,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: context.width16),
      child: Container(
        width: context.width238,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.circleAvatarBackground)
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: context.width6,
                  right: context.width16,
                  top: context.height6,
                  bottom: context.height6),
              child: Stack(
                children: [
                  ProductPhotoListView(
                    photo: productPhoto,
                    width: context.width88,
                    photoWidth: context.width44,
                  ),
                  discount == true
                      ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: context.height * 0.008,
                        horizontal: context.width * 0.014),
                    child: DiscountContainer(
                      discountPercent: discountPercent,
                      width: context.width32,
                      height: context.height16,
                      fontSize: 10.sp,
                    ),
                  )
                      : Container(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: context.height11,
                    bottom: context.height11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListProductName(
                      text: productName,
                    ),
                    ListProductType(
                      text: productType,
                    ),
                    ListProductPrice(
                      text: productPrice,
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
