import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/pages/order_details_screen.dart';
import 'package:mega_top_mobile/features/cart_screens/data/models/checkout_model.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_success_icon.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_success_text.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_number_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrderConfirmationScreen extends StatelessWidget {
  final String? orderId;
  final String? totalPrice;
  final bool? completed;
  final List<ProductCheckout>? products;
  final DropOffAddress? dropOffAddress;

  const OrderConfirmationScreen({
    super.key,
    required this.orderId,
    required this.completed,
    required this.products,
    required this.dropOffAddress, required this.totalPrice,
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
            PrimaryButton(
              content: Text(
                AppLocalizations.of(context)!.viewOrder,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrdersDetailsScreen(
                      totalPrice: totalPrice,
                      orderId: orderId,
                      products: products,
                      dropOffAddress: dropOffAddress,
                      completed: completed,
                    ),
                  )
                );
              },
            ),
            VerticalSpace(context.height * 0.033),
            /// Continue Shopping Button
            PrimaryOutlinedButton(
              text: AppLocalizations.of(context)!.continueShoppingOrderConfirmationScreen,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
