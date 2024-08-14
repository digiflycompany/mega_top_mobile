import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/custom_divider.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_checkout_details_title_text.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_checkout_list.dart';
import '../../data/models/checkout_model.dart';

class YourOrderCheckoutCard extends StatelessWidget {
  final List<Product>? products;
  const YourOrderCheckoutCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.033),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
          Border.all(width: 1.w, color: AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.022,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
            MainAxisSize.min, // Make the column take up only required space
            children: [
              OrderCheckoutDetailsTitleText(productsQuantity: products!.length.toString(),),
              const CustomDivider(),
              VerticalSpace(context.height * 0.033),
              YourOrderCheckoutList(
                products: products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
