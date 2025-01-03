import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_small_card_address.dart';

class ShippingCheckoutDetailsSmallDescription extends StatelessWidget {
  final String? name;
  final String? address;
  final String? city;
  const ShippingCheckoutDetailsSmallDescription({
    super.key,
    required this.name,
    required this.address,
    required this.city
  });

  @override
  Widget build(BuildContext context) {
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
                    customerName: name,
                    address: address,
                    city: city,
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
