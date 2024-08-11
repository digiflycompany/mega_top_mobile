import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';

class ProductsGridContainer extends StatelessWidget {

  const ProductsGridContainer(
      {super.key,
      required this.index,
      this.discount = false,
      this.discountPercent,
      this.product,  this.onTap});

  final int index;
  final String? discountPercent;
  final bool? discount;
  final product;
  final Function ? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: context.width * 0.43,
        height: context.height * 0.325,
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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: context.width * 0.022,
                  right: context.width * 0.022,
                  top: context.height * 0.012,
                  bottom: context.height * 0.01,
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: context.height * 0.174,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(context.height * 0.0065),
                        color: AppColors.iconsBackgroundColor,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: product.images[0],
                        fit: BoxFit.fill,
                        width: double.infinity,
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                    ),
                    discount == true
                        ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.height * 0.012,
                          horizontal: context.width * 0.022),
                      child: DiscountContainer(
                        discountPercent: discountPercent,
                      ),
                    )
                        : Container(),
                    // Align(
                    //     alignment: AlignmentDirectional.topEnd,
                    //     child: Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: context.height * 0.012,
                    //           horizontal: context.width * 0.022),
                    //       child: SvgPicture.asset(
                    //         AppAssets.favourOutlinedIcon,
                    //         width: context.width * 0.054,
                    //       ),
                    //     )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: context.width * 0.022,
                    right: context.width * 0.022,
                    bottom: context.height * 0.012),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        product.title!,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                      ),
                    ),
                    VerticalSpace(context.height * 0.006),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        product.categoryId!.name!,
                        style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const AvailableContainer(),
                        const Spacer(),
                        Text(
                          product.price!.finalPrice!.toString(),
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700),
                        )
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
