import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';

class EditEmailTextField extends StatelessWidget {
  final String title;
  final String text;
  const EditEmailTextField({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return EditTextField(
      title: title,
      text: text,
    );
  }
}
