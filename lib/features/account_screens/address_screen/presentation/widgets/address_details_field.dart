import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_state.dart';

class AddressDetailsField extends StatelessWidget {
  final TextEditingController controller;
  const AddressDetailsField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: EditTextField(
            controller: controller,
            title: AppStrings.addressDetails,
            hintText: AppStrings.addressDetailsHint,
            validator: (value){
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterYourAddressDetails;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
