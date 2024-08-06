import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';

class AddressNameField extends StatelessWidget {
  const AddressNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return  const EditTextField(
      title: AppStrings.name,
      hintText: AppStrings.enterYourNameHere,
    );
  }
}
