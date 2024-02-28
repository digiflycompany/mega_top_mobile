import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/cancel_order.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_status_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_details_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_method_small_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_small_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_card.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.orderDetailsEn,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width16,),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: const Column(
            children: [
              OrderStatusCard(),
              OrderDetailsCard(),
              ShippingDetailsSmallCard(),
              PaymentMethodSmallCard(
                paymentMethod: AppStrings.cashOnDeliveryEn,
              ),
              YourOrderCard(),
              CancelOrderCard(),
            ],
          ),
        ),
      ),
    );
  }
}
