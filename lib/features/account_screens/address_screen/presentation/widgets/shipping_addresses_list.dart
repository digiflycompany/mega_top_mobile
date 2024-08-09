import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/edit_address_screen_provider.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/shipping_addresses_list_shimmer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_card.dart';

class ShippingAddressDetailsList extends StatelessWidget {
  const ShippingAddressDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is UserAddressesLoading) {
          return ShippingAddressesListShimmer();
        }
        else if (state is UserAddressesSuccess && state.user.data.length>0) {
          return Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.user.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final addressItem = state.user.data[index];
                  return ShippingDetailsCard(
                    customerName: addressItem.name,
                    customerAddress: addressItem.firstLine,
                    customerCity: addressItem.cityId.name,
                    editOnTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAddressScreenProvider(
                            name: addressItem.name,
                            address: addressItem.firstLine,
                            addressDetails: addressItem.secondLine,
                            addressID: addressItem.id,
                            city: addressItem.cityId.name,
                          ),
                        ),
                      );
                    },
                    removeOnTap: (){
                      context.read<AddressCubit>().showRemoveItemDialog(
                        context,
                        addressItem.id
                      );
                    },
                  );
                },
              ),
              VerticalSpace(context.height * 0.012),
              PrimaryOutlinedButton(
                    text: AppStrings.addNewAddressEn,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.addNewAddressDetailsPageRoute).then((_) {
                        context.read<AddressCubit>().getUserAddresses();
                      });
                    },
                  ),
              VerticalSpace(context.height * 0.069),
            ],
          );
        }
        else if (state is UserAddressesSuccess && state.user.data.length==0) {
          return EmptyDataPage(
            icon: AppAssets.emptyAddressIcon,
            bigFontText: AppStrings.noShippingAddressEn,
            smallFontText: AppStrings.emptyAddressPageDescription,
            buttonText: AppStrings.addNewAddressEn,
            buttonOnTap: () {
              Navigator.pushNamed(context, Routes.addNewAddressDetailsPageRoute)
                  .then((_) {
                context.read<AddressCubit>().getUserAddresses();
              });
            }
          );
        }
        else if (state is AddressNoInternetConnection) {
          return NoInternetScreen(
              buttonOnTap: () =>
                  context.read<AddressCubit>().getUserAddresses()
          );
        }
        return Container();
      },
    );
  }
}
