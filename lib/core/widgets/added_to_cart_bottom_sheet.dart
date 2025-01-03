import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'cart_bottom_sheet_product_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddToCartBottomSheet extends StatelessWidget {
  const AddToCartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: context.height * 0.407,
            color: Colors.white,
            child: Column(
              children: [
                const CartBottomSheetProductDetails(),
                Expanded(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: context.width * 0.045),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// View Cart Button
                        PrimaryButton(
                          content: Text(
                            AppLocalizations.of(context)!.viewCart,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Routes.cartPageRoute.moveTo;
                          },
                        ),
                        VerticalSpace(context.height * 0.033),
                        /// Continue Shopping Button
                        PrimaryOutlinedButton(
                          text: AppLocalizations.of(context)!.continueShopping,
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}
