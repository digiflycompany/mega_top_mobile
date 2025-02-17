import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/order_status_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_details_checkout_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_method_small_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_checkout_details_small_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_checkout_card.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import '../../../../cart_screens/data/models/checkout_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrdersDetailsScreen extends StatelessWidget {
  final String? orderId;
  final String? totalPrice;
  final bool? completed;
  final List<ProductCheckout>? products;
  final DropOffAddress? dropOffAddress;
  const OrdersDetailsScreen({super.key,
    required this.orderId,
    required this.completed,
    required this.products,
    required this.dropOffAddress,
    required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: PrimaryAppBar(
            AppLocalizations.of(context)!.orderDetails,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width16,),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              OrderStatusCard(orderId: orderId,),
              OrderDetailsCheckoutCard(
                productPrice: totalPrice,
                productQuantity: products!.length.toString(),
                totalPrice: totalPrice,
              ),
              ShippingCheckoutDetailsSmallCard(
                name: dropOffAddress!.name,
                address: dropOffAddress!.firstLine,
                city: dropOffAddress!.cityName,
              ),
              PaymentMethodSmallCard(
                paymentMethod: AppLocalizations.of(context)!.cashOnDelivery,
              ),
              YourOrderCheckoutCard(
                products: products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
