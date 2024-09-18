import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_small_card_address.dart';

class ShippingDetailsSmallDescription extends StatelessWidget {
  const ShippingDetailsSmallDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedAddress = PreferencesHelper.getSelectedAddress();
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: context.width * 0.045, left: context.width * 0.045),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Location Icon
                SvgPicture.asset(AppAssets.locationOutlinedBlueIcon),
                HorizontalSpace(context.width * 0.022),

                /// Shipping Details
                Expanded(
                  child: ShippingDetailsSmallCardAddress(
                    customerName: selectedAddress['name'],
                    address: selectedAddress['address'],
                    city: selectedAddress['cityName'],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
