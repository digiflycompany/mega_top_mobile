import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/edit_drop_down_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateCityDropDown extends StatefulWidget {
  final String? initialCityName;
  final Function(String?) onCityChanged;

  const UpdateCityDropDown({
    super.key,
    required this.initialCityName,
    required this.onCityChanged,
  });

  @override
  _UpdateCityDropDownState createState() => _UpdateCityDropDownState();
}

class _UpdateCityDropDownState extends State<UpdateCityDropDown> {
  String? selectedCityName;
  String? cityId;

  @override
  void initState() {
    super.initState();
    selectedCityName = widget.initialCityName;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialCityName != null && widget.initialCityName!.isNotEmpty) {
        final cubit = context.read<AddressCubit>();
        final state = cubit.state;

        if (state is CitiesSuccess) {
          final selectedCity = state.user.data!.cities.firstWhere(
                (city) => city.name == widget.initialCityName,
          );
          setState(() {
            cityId = selectedCity.id;
          });
          cubit.updateCity(cityId!);
                }
      }
    });
  }

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
              title: AppLocalizations.of(context)!.cityTextField,
              items: cityNames,
              hintText: AppLocalizations.of(context)!.selectYourCity,
              selectedValue: selectedCityName,
              onChanged: (value) async {
                if (value != null) {
                  final selectedCity = cities.firstWhere((city) => city.name == value);
                  setState(() {
                    selectedCityName = selectedCity.name;
                    cityId = selectedCity.id;
                  });
                  widget.onCityChanged(selectedCity.id);
                  context.read<AddressCubit>().updateCity(selectedCity.id);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseChooseYourCity;
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
