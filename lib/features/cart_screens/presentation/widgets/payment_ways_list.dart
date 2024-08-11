import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/cart_screens/data/models/payment_card_model.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/payment_card.dart';

class PaymentWaysList extends StatelessWidget {
  const PaymentWaysList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaymentCardModel> paymentCard = [
      PaymentCardModel(
        paymentType: AppStrings.cashOnDeliveryEn,
        paymentIcon: AppAssets.walletIcon,
      ),
      PaymentCardModel(
        paymentType: AppStrings.debitCardEn,
        paymentIcon: AppAssets.creditCardIcon,
      ),
    ];
    return BlocProvider(
      create: (context) => CartCubit(CartRepoImp()),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          //CartCubit cartCubit = CartCubit.getCubit(context);
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: paymentCard.length,
            itemBuilder: (BuildContext context, int index) {
              final card = paymentCard[index];
              //final isSelected = cartCubit.selectedPaymentCardIndex == index;
              return GestureDetector(
                  onTap: () {
                    //cartCubit.selectPaymentCard(index);
                  //  cartCubit.selectOption(card.paymentType);
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
        },
      ),
    );
  }
}
