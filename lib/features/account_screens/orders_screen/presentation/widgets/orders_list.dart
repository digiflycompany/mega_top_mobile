import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_detailed_card.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_items_list.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/product_card.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        OrdersCubit ordersCubit = context.read<OrdersCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width16, vertical: context.height24),
          child: ordersCubit.selected == 0 ? Column(
            children: [
              const OrderDetailedCard(card: OrderItemsList(),),
              VerticalSpace(context.height24),
              const OrderDetailedCard(card: ProductOrderCard(
                productName: AppStrings.upsVersion1En,
                productPhoto: AppAssets.upsSearchResult,
                productType: AppStrings.storageUnitsEn,
                productPrice: AppStrings.le1500,
                discountPercent: AppStrings.discountPercentEn,
                discount: true,
              ),),
            ],
          ) : Column(
            children: [
              const OrderDetailedCard(card: OrderItemsList(),orderStatus: AppStrings.completed,),
              VerticalSpace(context.height24),
              const OrderDetailedCard(card: ProductOrderCard(
                productName: AppStrings.upsVersion1En,
                productPhoto: AppAssets.upsSearchResult,
                productType: AppStrings.storageUnitsEn,
                productPrice: AppStrings.le1500,
                discountPercent: AppStrings.discountPercentEn,
                discount: true,
              ),
              orderStatus: AppStrings.cancelledEn,
              ),
            ],
          ),
        );
      },
    );
  }
}
