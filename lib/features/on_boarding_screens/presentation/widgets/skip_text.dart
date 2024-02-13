import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class SkipText extends StatelessWidget {
  final Function()? onTap;
  const SkipText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.only(top: context.height*0.058,right: context.width*0.01),
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Padding(
           padding:   EdgeInsets.all(context.height*0.0165),
           child: const Text(
             AppStrings.skipEn,
             style: TextStyle(
               color: AppColors.primaryColor,
               fontSize: 14,
               fontWeight: FontWeight.w600,
             ),
           ),
                      ),
        ),
      ),
    );
  }
}
