import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/cart_screens/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/presentation/widgets/primary_app_bar.dart';
import '../widgets/cart_screen_title_text.dart';
import '../widgets/shipping_details_card_list.dart';

class ShippingDetailsPage extends StatelessWidget {
  final bool isEmpty = false;
  const ShippingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.shippingDetailsEn,
            favour: false,
          )),
      body: isEmpty
          ? const EmptyDataPage(
              icon: AppAssets.emptyAddressIcon,
              bigFontText: AppStrings.noShippingAddressEn,
              smallFontText: AppStrings.noShippingAddressSmallTextEn,
              buttonText: AppStrings.addNewAddressEn,
            )
          : BlocProvider(
              create: (context) => CartCubit(),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.width * 0.045),
                child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartScreensTitleText(
                        text: AppStrings.selectTheDeliveryAddressEn,
                      ),
                      ShippingDetailsCardList(),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: PrimaryButton(
          content: Text(
            AppStrings.confirmShippingAddressEn,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          onTap: () => Routes.paymentMethodsPageRoute.moveTo,
        ),
      ),
    );
  }
}
