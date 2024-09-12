import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/edit_drop_down_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateCityDropDown extends StatefulWidget {
  final String? initialCityName;
  final Function(String?) onCityChanged;

  const UpdateCityDropDown({
    super.key,
     this.initialCityName,
    required this.onCityChanged,
  });

  @override
  _UpdateCityDropDownState createState() => _UpdateCityDropDownState();
}

class _UpdateCityDropDownState extends State<UpdateCityDropDown> {
  String? selectedCityName;

  @override
  void initState() {
    super.initState();
    // Initialize the selectedCityName with the initial city name provided
    selectedCityName = widget.initialCityName ?? null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
      if (state is CitiesSuccess) {
        final cities = state.user.data!.cities;
        final cityNames = cities.map((city) => city.name).toList();
        return Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: EditDropdownField(
                title: AppLocalizations.of(context)!.cityTextField,
                items: cityNames,
                hintText: AppLocalizations.of(context)!.selectYourCity,
                selectedValue: selectedCityName,
                onChanged: (value) async {
                  if (value != null) {
                    print('Selected item: $value');
                    final selectedCity =
                        cities.firstWhere((city) => city.name == value);
                    setState(() {
                      selectedCityName =
                          selectedCity.name; // Update the selected city name
                    });
                    widget.onCityChanged(selectedCity.id);
                    context.read<AddressCubit>().updateCity(selectedCity.id);
                  } else {
                    var cache = await SharedPreferences.getInstance();
                    context
                        .read<AddressCubit>()
                        .updateCity(cache.getString('city_id')!);
                  }
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
