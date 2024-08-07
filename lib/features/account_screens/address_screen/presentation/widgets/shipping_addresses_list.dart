import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/shipping_addresses_list_shimmer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_card.dart';

class ShippingAddressDetailsList extends StatelessWidget {
  const ShippingAddressDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            if (state is UserAddressesLoading) {
              return ShippingAddressesListShimmer();
            } else if (state is UserAddressesSuccess) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.user.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final addressItem = state.user.data[index];
                  return ShippingDetailsCard(
                    customerName: addressItem.name,
                    customerAddress: addressItem.firstLine,
                    customerCity: addressItem.cityId.name,
                    editOnTap: () {},
                    removeOnTap: () {},
                  );
                },
              );
            } else if (state is AddressNoInternetConnection) {
              return NoInternetScreen(
                  buttonOnTap: () =>
                      context.read<AddressCubit>().getUserAddresses()
              );
            }
            return Container();
          },
        ),
        VerticalSpace(context.height * 0.012),
        BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            return state is AddressNoInternetConnection?VerticalSpace(20.h):PrimaryOutlinedButton(
              text: AppStrings.addNewAddressEn,
              onTap: () => Routes.addNewAddressDetailsPageRoute.moveTo,
            );
          },
        ),
        VerticalSpace(context.height * 0.069),
      ],
    );
  }
}
