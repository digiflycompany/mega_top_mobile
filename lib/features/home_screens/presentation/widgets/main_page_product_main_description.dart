import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/not_available_container.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_detailed_category.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_detailed_small_description.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_name.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_prices.dart';

class MainPageProductMainDescription extends StatelessWidget {
  final String? name;
  final String? categoryName;
  final String? finalPrice;
  final String? originalPrice;
  final String? description;
  final int? quantity;
  final cubit;
  const MainPageProductMainDescription({
    super.key,
    required this.name,
    required this.quantity,
    required this.cubit,
    required this.categoryName,
    required this.finalPrice,
    required this.originalPrice,
    required this.description,

  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: EdgeInsets.only(top: context.height * 0.033),
          child: Column(
            children: [
              /// Product Details Row ////
              Row(
                children: [
                  Expanded(
                    child: ProductDetailedNameText(
                      name:name,
                    ),
                  ),
                  HorizontalSpace(5.w),
                  quantity !=0 ?const AvailableContainer() : NotAvailableContainer(),
                  HorizontalSpace(context.width * 0.022),
                  // DiscountContainer(
                  //   width: context.width * 0.118,
                  //   height: context.height * 0.033,
                  //   discountPercent: "${cubit.getDiscountPercentage(
                  //       finalPrice: finalPrice.toInt,
                  //       originPrice: originalPrice.toInt)}%",)
                ],
              ),
              VerticalSpace(context.height * 0.011),
              ProductDetailedCategory(
                category: categoryName,
              ),
              VerticalSpace(context.height * 0.022),
              ProductPrices(
                currentPrice: finalPrice,
                oldPrice: originalPrice,
              ),
              VerticalSpace(context.height * 0.029),
              ProductDetailedSmallDescription(
                description: description,
              )
            ],
          ),
        );
  }
}
