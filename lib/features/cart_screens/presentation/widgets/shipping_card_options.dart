import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/remove_shipping_details_container.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';
import 'customer_name.dart';
import 'edit_shipping_details_container.dart';

class ShippingCardOptions extends StatelessWidget {
  final Function()? editOnTap;
  final Function()? removeOnTap;
  final String? customerName;
  const ShippingCardOptions({super.key, this.customerName, this.editOnTap, this.removeOnTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.locationOutlinedIcon),
        HorizontalSpace(context.width * 0.022),
        CustomerName(text: customerName,),
        const Spacer(),
        EditShippingDetailsContainer(onTap: editOnTap,),
        HorizontalSpace(context.width * 0.045),
        RemoveShippingDetailsContainer(editOnTap: removeOnTap,)
      ],
    );
  }
}
