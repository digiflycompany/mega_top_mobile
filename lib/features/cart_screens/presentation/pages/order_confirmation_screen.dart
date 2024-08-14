import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_success_icon.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_success_text.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_number_text.dart';
import '../../data/models/checkout_model.dart';


class OrderConfirmationScreen extends StatelessWidget {
  final String? orderId;
  final bool? completed;
  final List<Product>? products;
  final DropOffAddress? dropOffAddress;

  const OrderConfirmationScreen({
    super.key,
    required this.orderId,
    required this.completed,
    required this.products,
    required this.dropOffAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.045,
            vertical: context.height * 0.069),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const OrderSuccessIcon(
              img: AppAssets.orderSuccessImg,
            ),
            const OrderSuccessText(),
            YourOrderNumberText(
              orderNumber: orderId,
            ),
            const Spacer(),
            /// View Order Button
            // PrimaryButton(
            //   content: Text(
            //     AppStrings.viewOrderEn,
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.w700,
            //       fontSize: 16.sp,
            //     ),
            //   ),
            // ),
            // VerticalSpace(context.height * 0.033),
            /// Continue Shopping Button
            PrimaryOutlinedButton(
              text: AppStrings.continueShoppingEn,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
