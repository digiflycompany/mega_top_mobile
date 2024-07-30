import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/widgets/edit_text_form_field.dart';

class EditFullNameTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const EditFullNameTextField({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: EditTextField(
        title: title,
        controller: controller,
        suffix: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(
            AppAssets.editIcon,
          ),
        ),
      ),
    );
  }
}
