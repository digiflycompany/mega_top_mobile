import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../utils/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  const PrimaryButton({super.key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
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
                  fontWeight: FontWeight.w600,
                  fontSize: 17
              ),
            ),
          ),
        ),
      ),
    );
  }
}
