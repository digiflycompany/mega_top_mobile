import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/cubit/address_state.dart';
import 'package:mega_top_mobile/features/cart_screens/data/shipping_details_card_model.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_card.dart';

class ShippingAddressDetailsList extends StatelessWidget {
  const ShippingAddressDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ShippingDetailsCardModel> shippingCard = [
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
    ];
    return Column(
      children: [
        BlocProvider(
          create: (context) => AddressCubit(),
          child: BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              AddressCubit addressCubit = context.read<AddressCubit>();
              GlobalCubit globalCubit = context.read<GlobalCubit>();
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: shippingCard.length,
                itemBuilder: (BuildContext context, int index) {
                  final card = shippingCard[index];
                  return ShippingDetailsCard(
                    deliveryPlace: card.deliveryPlace,
                    customerName: card.customerName,
                    customerAddress: card.customerAddress,
                    customerPhone: card.customerPhone,
                    editOnTap: () =>
                        globalCubit.showPrimaryToast(context,AppStrings.addressHasBeenEdited),
                    removeOnTap: () => addressCubit.showRemoveItemDialog(context),
                  );
                },
              );
            },
          ),
        ),
        VerticalSpace(context.height * 0.012),
        PrimaryOutlinedButton(
          text: AppStrings.addNewAddressEn,
          onTap: ()=> Routes.addNewAddressPageRoute.moveTo,
        ),
        VerticalSpace(context.height * 0.069),
      ],
    );
  }
}
