import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/custom_divider.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_list.dart';
import '../../../../core/utils/app_color.dart';
import 'card_title_text.dart';

class YourOrderCard extends StatelessWidget {
  final String? paymentMethod;
  const YourOrderCard({super.key, this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.033),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(width: 1.w, color: AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.022,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
                MainAxisSize.min, // Make the column take up only required space
            children: [
              const CardTitleText(title: AppStrings.yourOrderTwoProductsEn),
              const CustomDivider(),
              VerticalSpace(context.height * 0.033),
              const YourOrderList(),
            ],
          ),
        ),
      ),
    );
  }
}
