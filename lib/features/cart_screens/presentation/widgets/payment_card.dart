import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/debit_cards_empty_container.dart';
import 'debit_cards_container.dart';

class PaymentCard extends StatelessWidget {
  final String? paymentIcon;
  final String? paymentType;
  final bool isSelected;
  final String value;
  final int? paymentCardIndex;

  const PaymentCard(
      {super.key, this.paymentIcon, this.paymentType, required this.isSelected, required this.value, this.paymentCardIndex});

  @override
  Widget build(BuildContext context) {
      return Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.033),
          child: isSelected && paymentCardIndex == AppStrings.one ?DebitCardsContainer(
            isSelected: isSelected,
            value: value,
            paymentType: paymentType,
            paymentIcon: paymentIcon,
            paymentCardIndex: paymentCardIndex,
          ):DebitCardsEmptyContainer(
              isSelected: isSelected,
              value: value,
              paymentType: paymentType,
              paymentIcon: paymentIcon,
              paymentCardIndex: paymentCardIndex,
          ),
        );
  }
}
