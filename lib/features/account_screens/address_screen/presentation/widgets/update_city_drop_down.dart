import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/edit_drop_down_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';

class UpdateCityDropDown extends StatelessWidget {
  final String? city;
  final Function(String?) onCityChanged;

  const UpdateCityDropDown({
    super.key,
    required this.city,
    required this.onCityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is CitiesSuccess) {
          final cities = state.user.data!.cities;
          final cityNames = cities.map((city) => city.name).toList();
          return Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: EditDropdownField(
              title: AppStrings.city,
              items: cityNames,
              hintText: AppStrings.selectYourCity,
              selectedValue: city,
              onChanged: (value) async {
                print('Selected item: $value');
                final selectedCity = cities.firstWhere((city) => city.name == value);
                onCityChanged(selectedCity.id);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.pleaseChooseYourCity;
                }
                return null;
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
