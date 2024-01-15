import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../utils/app_color.dart';

class PrimaryTextField extends StatelessWidget {
  final String? hintText;
  final String? prefixSvg;
  const PrimaryTextField({super.key, this.hintText, this.prefixSvg});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.blackGreyColor,
      cursorHeight: context.width*0.046,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.greyTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.googleButtonBorder),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
        prefixIconConstraints: BoxConstraints(minWidth:context.width*0.072),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(prefixSvg!, width: context.width*0.063 , height: context.height*0.026 , fit: BoxFit.scaleDown,),
          ],
        ),
      ),
    );
  }
}