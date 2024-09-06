import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressNameField extends StatelessWidget {
  final TextEditingController controller;
  const AddressNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: EditTextField(
            controller: controller,
            title: AppLocalizations.of(context)!.name,
            hintText: AppLocalizations.of(context)!.enterYourNameHere,
            validator: (value){
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.pleaseEnterYourName;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
