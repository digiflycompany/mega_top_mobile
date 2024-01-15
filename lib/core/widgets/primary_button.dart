import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final int? fontSize;
  const PrimaryButton({super.key, this.onTap, this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.height*0.069,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child:  Center(
          child: Text(
            text!,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 17
            ),
          ),
        ),
      ),
    );
  }
}
