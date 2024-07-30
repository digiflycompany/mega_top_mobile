import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';

class EditPhoneTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const EditPhoneTextField({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return EditTextField(
      title: title,
      controller: controller,
      suffix: Transform.scale(
        scale: 0.5,
        child: SvgPicture.asset(
          AppAssets.editIcon,
        ),
      ),
    );
  }
}
