import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/current_previous_orders_row.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_date_day.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_number_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/product_list_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/custom_divider.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  static const bool isEmpty = false;
  const OrdersScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const PrimaryAppBar(
            AppStrings.orders,
            favour: false,
          )),
      body: Column(
        children: [
          const CurrentPreviousOrdersRow(),
          isEmpty?const Expanded(
            child: EmptyDataPage(
              bigFontText: AppStrings.noCurrentOrdersEn,
              icon: AppAssets.emptyOrderIcon,
              smallFontText: AppStrings.emptyOrderScreenDescriptionEn,
              buttonText: AppStrings.continueShoppingEn,
            ),
          ):Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width16,vertical: context.height24),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: context.height204,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.containerShadow,
                        offset: Offset(0, 2),
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.width16,vertical: context.height16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const OrderNumberAndState(),
                        VerticalSpace(context.height12),
                        const OrderDateAndDay(),
                        CustomDivider(
                          topPadding: context.height16,
                          bottomPadding: context.height16,
                        ),
                        const ProductsListCard(
                          productName: AppStrings.upsVersion1En,
                          productPhoto: AppAssets.upsSearchResult,
                          productType: AppStrings.storageUnitsEn,
                          productPrice: AppStrings.le1500,
                          discountPercent: AppStrings.discountPercentEn,
                          discount: true,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
