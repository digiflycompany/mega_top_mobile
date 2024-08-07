import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/repositories/address_repo.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/add_new_address_shimmer.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_details_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/address_name_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/city_drop_down.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/widgets/save_address_button.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(AddressRepoImp())..getCities(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.addNewAddress,
            favour: false,
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.045,
              vertical: context.height * 0.033,
            ),
            child: BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                if (state is CitiesSuccess) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AddressField(),
                        const AddressDetailsField(),
                        const CityDropDown(),
                        const AddressNameField(),
                      ],
                    ),
                  );
                } else if (state is CitiesLoading) {
                  return const AddNewAddressShimmer();
                } else if (state is AddressNoInternetConnection) {
                  return NoInternetScreen(
                    buttonOnTap: () => context.read<AddressCubit>().getCities(),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: SaveAddressButton(formKey: _formKey),
      ),
    );
  }
}
