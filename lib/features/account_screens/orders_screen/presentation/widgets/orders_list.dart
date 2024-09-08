import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/big_circular_progress_indicator.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_detailed_card.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_items_list.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        OrdersCubit ordersCubit = context.read<OrdersCubit>();
        if(state is OrdersLoaded && ordersCubit.orders.isEmpty){
          return EmptyDataPage(
            icon: AppAssets.emptyOrderIcon,
            smallFontText: AppLocalizations.of(context)!.noOrders,
            bigFontText: AppLocalizations.of(context)!.allOrdersWillBeSaved,
          );
        }
        if (state is OrdersLoading && ordersCubit.orders.isEmpty) {
          return const Center(child: BigCircularProgressIndicator());
        }
        if (state is OrdersFailure) {
          ordersCubit.showErrorToast(context, AppLocalizations.of(context)!.failedToLoadOrders, state.error);
        }
        if (state is OrdersNoInternetConnection) {
          return NoInternetScreen(buttonOnTap: ()=>ordersCubit.refreshOrders());
        }
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width16, vertical: context.height24),
          child: ListView.builder(
            itemCount: ordersCubit.orders.length + (ordersCubit.hasMoreOrders ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < ordersCubit.orders.length) {
                final order = ordersCubit.orders[index];
                return Column(
                  children: [
                    VerticalSpace(context.height12),
                    OrderDetailedCard(
                      orderDate: order.formattedCreatedAt,
                      orderId: order.id,
                      card: OrderItemsList(order: order),
                    ),
                    VerticalSpace(context.height12),
                  ],
                );
              } else {
                ordersCubit.loadOrders();
                return const Center(child: BigCircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
