import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_card.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/primary_empty_button.dart';

class ShippingDetailsCardList extends StatelessWidget {
  const ShippingDetailsCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return const ShippingDetailsCard(
              deliveryPlace: AppStrings.homeEn,
              customerName: AppStrings.customerNameEn,
              customerAddress: AppStrings.addressNasrCityEn,
              customerPhone: AppStrings.telephoneAddressEn,
            );
          },
        ),
        VerticalSpace(context.height*0.012),
        const PrimaryOutlinedButton(
          text: AppStrings.addNewAddressEn,
        ),
      ],
    );
  }
}
