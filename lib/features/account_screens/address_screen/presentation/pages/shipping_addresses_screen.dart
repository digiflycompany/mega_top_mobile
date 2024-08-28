import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/shipping_addresses_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: PrimaryAppBar(
            AppLocalizations.of(context)!.shippingAddresses,
            favour: false,
          )),
      body: Padding(
        padding:
        EdgeInsets.only(right: context.width * 0.045,left:context.width * 0.045,top: context.height*0.033 ),
        child: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ShippingAddressDetailsList()),
      ),
    );
  }
}

