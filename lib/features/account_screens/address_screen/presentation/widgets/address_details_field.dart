import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';

class AddressDetailsField extends StatelessWidget {
  const AddressDetailsField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: EditTextField(
        title: AppStrings.addressDetails,
        hintText: AppStrings.addressDetailsHint,
      ),
    );
  }
}
