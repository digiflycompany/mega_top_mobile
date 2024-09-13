import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/add_new_address_shimmer.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_details_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_name_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/edit_address_button.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/update_city_drop_down.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditAddressScreen extends StatefulWidget {
  final String name;
  final String address;
  final String addressDetails;
  final String city;
  final String cityID;
  final String addressID;

  const EditAddressScreen({
    super.key,
    required this.name,
    required this.address,
    required this.addressDetails,
    required this.city,
    required this.cityID,
    required this.addressID,
  });

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late AddressCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddressCubit>();
    cubit.nameController.text = widget.name;
    cubit.addressController.text = widget.address;
    cubit.addressDetailsController.text = widget.addressDetails;
    cubit.city = widget.city;
    cubit.cityId = widget.cityID;
    cubit.id = widget.addressID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.height * 0.089),
        child: PrimaryAppBar(
          AppLocalizations.of(context)!.editAddress,
          favour: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.045,
          vertical: context.height * 0.033,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (BuildContext context, AddressState state) {},
            builder: (BuildContext context, AddressState state) {
              return state is CitiesLoading?
              const AddNewAddressShimmer():
              state is AddressNoInternetConnection?
              NoInternetScreen(buttonOnTap: ()=>context.read<AddressCubit>()..getCities()):
              state is EditAddressLoading?const AddNewAddressShimmer():
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressField(controller: cubit.addressController),
                  AddressDetailsField(controller: cubit.addressDetailsController),
                  UpdateCityDropDown(
                    initialCityName: cubit.city,
                    onCityChanged: (newCityId) {
                      setState(() {
                        if(cubit.city.isEmptyOrNull){
                          cubit.cityId = newCityId!;
                        } else{
                          cubit.city = newCityId!;
                        }
                      });
                    },
                  ),
                  AddressNameField(controller: cubit.nameController),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: EditAddressButton(addressID: widget.addressID,cityID:cubit.cityId,),
    );
  }
}


