import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/custom_divider.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_card_icon.dart';

import '../../../../core/utils/app_color.dart';
import 'card_title_text.dart';

class PaymentMethodSmallCard extends StatelessWidget {
  final String? paymentMethod;
  const PaymentMethodSmallCard({super.key, this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.033),
      child: Container(
        width: double.infinity,
        height: context.height * 0.18,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(width: 1.w, color: AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: context.height * 0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardTitleText(
                title: AppStrings.paymentMethodEn,
              ),
              const CustomDivider(),
              Expanded(
                  child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.width * 0.045),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PaymentCardIcon(icon: AppAssets.walletIcon),
                    HorizontalSpace(context.width * 0.022),

                    /// Payment Method
                    Text(
                      paymentMethod!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
