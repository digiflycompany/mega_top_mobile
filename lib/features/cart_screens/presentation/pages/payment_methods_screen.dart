import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_screen_title_text.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_ways_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: PrimaryAppBar(
            AppLocalizations.of(context)!.paymentMethodPaymentScreen,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartScreensTitleText(text: AppLocalizations.of(context)!.selectPaymentMethod),
              PaymentWaysList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: PrimaryButton(
          content: Text(
            AppLocalizations.of(context)!.confirmPaymentProcess,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          onTap: () => Routes.checkoutAddressDetailsPageRoute.moveTo,
        ),
      ),
    );
  }
}
