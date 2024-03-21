import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/shipping_addresses_list.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class ShippingAddressScreen extends StatelessWidget {
  final bool isEmpty = false;

  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.shippingAddressesEn,
            favour: false,
          )),
      body: isEmpty ? const EmptyDataPage(
        icon: AppAssets.emptyAddressIcon,
        bigFontText: AppStrings.noShippingAddressEn,
        smallFontText: AppStrings.emptyComparePageDescriptionEn,
        buttonText: AppStrings.addNewAddressEn,
      ) : Padding(
        padding:
        EdgeInsets.only(right: context.width * 0.045,left:context.width * 0.045,top: context.height*0.033 ),
        child: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ShippingAddressDetailsList()),
      ),
    );
  }
}