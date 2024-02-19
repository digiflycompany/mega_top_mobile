import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/cart_screens/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/cart_screens/data/shipping_details_card_model.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_card.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/primary_empty_button.dart';

class ShippingDetailsCardList extends StatelessWidget {
  const ShippingDetailsCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List <ShippingDetailsCardModel> shippingCard = [
      ShippingDetailsCardModel(
        deliveryPlace: AppStrings.homeEn,
        customerName: AppStrings.customerNameEn,
        customerAddress: AppStrings.addressNasrCityEn,
        customerPhone: AppStrings.telephoneAddressEn,
      ),
      ShippingDetailsCardModel(
        deliveryPlace: AppStrings.companyEn,
        customerName: AppStrings.customerNameEn,
        customerAddress: AppStrings.addressNasrCityEn,
        customerPhone: AppStrings.telephoneAddressEn,
      ),
      ShippingDetailsCardModel(
        deliveryPlace: AppStrings.companyEn,
        customerName: AppStrings.customerNameEn,
        customerAddress: AppStrings.addressNasrCityEn,
        customerPhone: AppStrings.telephoneAddressEn,
      ),
    ];
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cartCubit = CartCubit.getCubit(context);
        return Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: shippingCard.length,
              itemBuilder: (BuildContext context, int index) {
                final card = shippingCard[index];
                final isSelected = cartCubit.selectedCardIndex == index;
                return GestureDetector(
                  onTap: () => cartCubit.selectCard(index),
                  child: ShippingDetailsCard(
                    deliveryPlace: card.deliveryPlace,
                    customerName: card.customerName,
                    customerAddress: card.customerAddress,
                    customerPhone: card.customerPhone,
                    isSelected: isSelected,
                  ),
                );
              },
            ),
            VerticalSpace(context.height * 0.012),
            const PrimaryOutlinedButton(
              text: AppStrings.addNewAddressEn,
            ),
            VerticalSpace(context.height * 0.069),
          ],
        );
      },
    );
  }
}