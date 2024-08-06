import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_details_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_name_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/city_drop_down.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/save_address_button.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.addNewAddress,
            favour: false,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.045,
          vertical: context.height * 0.033,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (BuildContext context, AddressState state) {},
            builder: (BuildContext context, AddressState state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AddressField(),
                  const AddressDetailsField(),
                  const CityDropDown(),
                  const AddressNameField(),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const SaveAddressButton(),
    );
  }
}
