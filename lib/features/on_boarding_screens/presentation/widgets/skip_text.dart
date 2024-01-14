import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class SkipText extends StatelessWidget {
  final Function()? onTap;
  const SkipText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.only(top: context.height*0.058,right: context.width*0.01),
        child: const Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Padding(
           padding:  EdgeInsets.all(12),
           child: Text(
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
