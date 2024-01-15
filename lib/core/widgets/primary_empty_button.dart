import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_color.dart';

class PrimaryEmptyButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  const PrimaryEmptyButton({super.key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Container(
          width: double.infinity,
          height: context.height*0.069,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child:  Center(
            child: Text(
              text!,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 17
              ),
            ),
          ),
        ),
      ),
    );
  }
}
