import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/edit_drop_down_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';

class CityDropDown extends StatelessWidget {
  const CityDropDown({super.key});

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
              onChanged: (value) {
                print('Selected item: $value');
                final selectedCity = cities.firstWhere((city) => city.name == value);
                context.read<AddressCubit>().city =selectedCity.id;
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
