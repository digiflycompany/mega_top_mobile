import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_screen_title_text.dart';

import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';
import '../widgets/payment_ways_list.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.paymentMethodsEn,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartScreensTitleText(text: AppStrings.selectPaymentMethodsEn),
              PaymentWaysList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: PrimaryButton(
          content: Text(
            AppStrings.confirmPaymentProcessEn,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          onTap: () => Routes.orderSummaryPageRoute.moveTo,
        ),
      ),
    );
  }
}
