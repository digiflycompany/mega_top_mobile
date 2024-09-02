import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/confirm_order_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_details_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_method_small_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_small_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_card.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: PrimaryAppBar(
            AppLocalizations.of(context)!.orderSummary,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              OrderDetailsCard(),
              ShippingDetailsSmallCard(),
              PaymentMethodSmallCard(
                paymentMethod: AppLocalizations.of(context)!.cashOnDelivery,
              ),
              YourOrderCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConfirmOrderButton(),
    );
  }
}
