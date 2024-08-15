import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/edit_address_screen_provider.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/shipping_addresses_list_shimmer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_screen_title_text.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_details_card.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class CheckoutAddressDetailsPage extends StatefulWidget {
  const CheckoutAddressDetailsPage({super.key});

  @override
  _CheckoutAddressDetailsPageState createState() => _CheckoutAddressDetailsPageState();
}

class _CheckoutAddressDetailsPageState extends State<CheckoutAddressDetailsPage> {
  String? selectedAddressId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.shippingDetailsEn,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.only(right: context.width * 0.045, left: context.width * 0.045),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              if (state is UserAddressesLoading) {
                return Padding(
                  padding: EdgeInsets.only(top: context.height64),
                  child: ShippingAddressesListShimmer(),
                );
              } else if (state is UserAddressesSuccess && state.user.data.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartScreensTitleText(
                      text: AppStrings.selectTheDeliveryAddressEn,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.user.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final addressItem = state.user.data[index];
                        final isSelected = selectedAddressId == addressItem.id;
                        return ShippingDetailsCard(
                          customerName: addressItem.name,
                          customerAddress: addressItem.firstLine,
                          customerCity: addressItem.cityId.name,
                          isSelected: isSelected,
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
                                  cityID: addressItem.cityId.id,
                                ),
                              ),
                            ).then((_) {
                              context.read<AddressCubit>().getUserAddresses();
                            });
                          },
                          removeOnTap: () {
                            context.read<AddressCubit>().showRemoveItemDialog(
                                context,
                                addressItem.id
                            );
                          },
                          onTap: () {
                            setState(() {
                              selectedAddressId = addressItem.id; // Update the selected address ID
                            });

                            PreferencesHelper.saveSelectedAddress(
                              id: addressItem.id,
                              name: addressItem.name,
                              address: addressItem.firstLine,
                              cityName: addressItem.cityId.name,
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
              } else if (state is UserAddressesSuccess && state.user.data.isEmpty) {
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
              } else if (state is AddressNoInternetConnection) {
                return NoInternetScreen(
                    buttonOnTap: () =>
                        context.read<AddressCubit>().getUserAddresses()
                );
              }
              return Container();
            },
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button:PrimaryButton(
          content: Text(
            AppStrings.confirmShippingAddressEn,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          onTap: () {
            if (selectedAddressId != null) {
              Routes.orderSummaryPageRoute.moveTo;
            } else {
              context.read<AddressCubit>().showErrorToast(context, AppStrings.confirmingAddressFailedEn, AppStrings.youHaveToSelectAnAddress);
            }
          },
        )
      ),
    );
  }
}


