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
import 'package:mega_top_mobile/features/home_screens/data/models/ad_details_model.dart';

class AdDescription extends StatelessWidget {
  const AdDescription({super.key, required this.ad});
  final AdDetailsData ad;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: context.height * 0.033),
        child: Column(children: [
          /// Product Details Row ////
          Row(children: [
            Expanded(child: ProductDetailedNameText(name: ad.title)),
            HorizontalSpace(5.w),
            ad.quantity != 0
                ? const AvailableContainer()
                : NotAvailableContainer(),
            HorizontalSpace(context.width * 0.022)
          ]),
          VerticalSpace(context.height * 0.011),
          ProductDetailedCategory(category: ad.categoryId?.name),
          VerticalSpace(context.height * 0.022),
          ProductPrices(
              currentPrice: ad.price?.finalPrice.toString(),
              oldPrice: ad.price?.originalPrice.toString()),
          VerticalSpace(context.height * 0.029),
          ProductDetailedSmallDescription(description: ad.description)
        ]));
  }
}