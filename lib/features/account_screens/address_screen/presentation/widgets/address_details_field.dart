import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressDetailsField extends StatelessWidget {
  final TextEditingController? controller;
  final String? init;
  const AddressDetailsField({super.key, this.controller, this.init});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: EditTextField(
            init: init,
            controller: controller,
            title: AppLocalizations.of(context)!.addressDetails,
            hintText: AppLocalizations.of(context)!.addressDetailsHint,
            validator: (value){
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.pleaseEnterYourAddressDetails;
              }
              return null;
            }
          )
        );
      }
    );
  }
}
