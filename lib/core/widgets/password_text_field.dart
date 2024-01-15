import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';

class PasswordTextField extends StatelessWidget {
  final String? hintText;
  final String? prefixSvg;
  final Widget? suffixIcon;
  final bool obscure;
  const PasswordTextField({super.key, this.hintText, this.prefixSvg, this.suffixIcon, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.blackGreyColor,
      cursorHeight: context.width*0.046,
      obscureText: obscure,
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
        suffixIconConstraints: BoxConstraints(minWidth:context.width*0.072),
        suffixIcon: suffixIcon
        //suffixIcon: SvgPicture.asset(AppAssets.showPasswordIcon,width: context.width*0.063 , fit: BoxFit.scaleDown,),
      ),
    );
  }
}
