import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/features/cart_screens/data/models/payment_card_model.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentWaysList extends StatelessWidget {
  const PaymentWaysList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaymentCardModel> paymentCard = [
      PaymentCardModel(
        paymentType:  AppLocalizations.of(context)!.cashOnDelivery,
        paymentIcon: AppAssets.walletIcon,
      ),
    ];
    return  ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: paymentCard.length,
          itemBuilder: (BuildContext context, int index) {
            final card = paymentCard[index];
            return GestureDetector(
                onTap: () {
                } ,
                child: PaymentCard(
                  paymentIcon: card.paymentIcon,
                  paymentType: card.paymentType,
                  value: card.paymentType,
                  isSelected: true,
                  paymentCardIndex:index,
                )
            );
          },
        );
  }
}
