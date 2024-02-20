import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_details_card.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.orderSummaryEn,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              OrderDetailsCard(),
              ShippingDetailsSmallCard(),
              PaymentMethodSmallCard(
                paymentMethod: AppStrings.cashOnDeliveryEn,
              ),
              YourOrderCard(
                paymentMethod: AppStrings.cashOnDeliveryEn,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ButtonBottomNavBar(
        button: PrimaryButton(
          text: AppStrings.confirmOrderEn,
        ),
      ),
    );
  }
}
