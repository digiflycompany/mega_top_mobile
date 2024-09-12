import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/edit_drop_down_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityDropDown extends StatelessWidget {
  const CityDropDown({super.key, this.selectedValue, this.onChanged});
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
      if (state is CitiesSuccess) {
        final cities = state.user.data!.cities;
        final cityNames = cities.map((city) => city.name).toList();
        return Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: EditDropdownField(
              selectedValue: selectedValue,
                title: AppLocalizations.of(context)!.cityTextField,
                items: cityNames,
                hintText: AppLocalizations.of(context)!.selectYourCity,
                onChanged: onChanged ?? (value) async {
                  print('Selected item: $value');
                  final selectedCity =
                      cities.firstWhere((city) => city.name == value);
                  context.read<AddressCubit>().city = selectedCity.id;
                  var cache = await SharedPreferences.getInstance();
                  cache.setString('city_id', selectedCity.id);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseChooseYourCity;
                  }
                  return null;
                }));
      } else {
        return Container();
      }
    });
  }
}