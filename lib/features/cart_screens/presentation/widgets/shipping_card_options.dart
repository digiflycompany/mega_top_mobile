import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/remove_shipping_details_container.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';
import 'delivery_title.dart';
import 'edit_shipping_details_container.dart';

class ShippingCardOptions extends StatelessWidget {
  final Function()? editOnTap;
  final Function()? removeOnTap;
  final String? deliveryPlace;
  const ShippingCardOptions({super.key, this.deliveryPlace, this.editOnTap, this.removeOnTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Location Icon
        SvgPicture.asset(AppAssets.locationOutlinedIcon),
        HorizontalSpace(context.width * 0.022),
        DeliveryTitle(text: deliveryPlace),
        const Spacer(),
        EditShippingDetailsContainer(onTap: editOnTap,),
        HorizontalSpace(context.width * 0.045),
        RemoveShippingDetailsContainer(editOnTap: removeOnTap,)
      ],
    );
  }
}
