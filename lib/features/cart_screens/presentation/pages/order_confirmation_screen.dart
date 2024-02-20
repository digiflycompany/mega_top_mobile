import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_number_text.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_success_icon.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';
import '../widgets/order_success_text.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width*0.045,vertical: context.height*0.069),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const OrderSuccessIcon(img: AppAssets.orderSuccessImg,),
            const OrderSuccessText(),
            const OrderNumberText(
              orderNumber: AppStrings.orderNumberEn,
            ),
            const Spacer(),
            /// View Order Button
            const PrimaryButton(
              text: AppStrings.viewOrderEn,
            ),
            VerticalSpace(context.height*0.033),
            /// Continue Shopping Button
            const PrimaryOutlinedButton(
              text: AppStrings.continueShoppingEn,
            ),
          ],
        ),
      ),
    );
  }
}
