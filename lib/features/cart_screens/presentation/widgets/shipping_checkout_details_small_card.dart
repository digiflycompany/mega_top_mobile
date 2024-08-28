import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_checkout_details_small_description_.dart';
import 'card_title_text.dart';
import 'custom_divider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShippingCheckoutDetailsSmallCard extends StatelessWidget {
  final String? name;
  final String? address;
  final String? city;
  const ShippingCheckoutDetailsSmallCard({
    super.key,
    required this.name,
    required this.address,
    required this.city
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.033),
      child: Container(
        width: double.infinity,
        height: context.height * 0.2235,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
          Border.all(width: 1.w, color: AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTitleText(
                title: AppLocalizations.of(context)!.shippingDetails,
              ),
              const CustomDivider(),
              ShippingCheckoutDetailsSmallDescription(
                name: name,
                address: address,
                city: city,
              )
            ],
          ),
        ),
      ),
    );
  }
}
