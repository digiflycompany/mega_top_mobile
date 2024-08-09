import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/repositories/address_repo.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/pages/edit_address_screen.dart';

class EditAddressScreenProvider extends StatelessWidget {
  final String name;
  final String address;
  final String addressDetails;
  final String city;
  final String cityID;
  final String addressID;

  const EditAddressScreenProvider({
    super.key,
    required this.name,
    required this.address,
    required this.addressDetails,
    required this.city,
    required this.cityID,
    required this.addressID,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(AddressRepoImp())..getCities(),
      child: EditAddressScreen(
        name: name,
        address: address,
        addressDetails: addressDetails,
        city: city,
        cityID: cityID,
        addressID: addressID,
      ),
    );
  }
}