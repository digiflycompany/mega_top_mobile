import 'package:flutter/material.dart';

class PaymentWaysList extends StatelessWidget {
  const PaymentWaysList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
