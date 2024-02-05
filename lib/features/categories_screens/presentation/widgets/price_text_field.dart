import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class PriceTextField extends StatelessWidget {
  const PriceTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width*0.433,
      height: context.height*0.065,
      child: TextFormField(
        cursorColor: AppColors.blackGreyColor,
        decoration: InputDecoration(
          labelText: AppStrings.priceInEgpEn,
          labelStyle: const TextStyle(
              color: AppColors.blackGreyColor,
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.height*0.006),
          ),
          contentPadding:  EdgeInsets.symmetric(horizontal: context.width*0.043, vertical: context.height*0.015),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.smallContainerGreyColor),
            borderRadius: BorderRadius.circular(context.height*0.006),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.smallContainerGreyColor),
            borderRadius: BorderRadius.circular(context.height*0.006),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
