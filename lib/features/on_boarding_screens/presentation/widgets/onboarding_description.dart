import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';

class OnboardingDescription extends StatelessWidget {
  final String? title;
  final String? description;
  const OnboardingDescription({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
      child: Column(
        children: [
           Text(
            title!,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700
            ),
          ),
          VerticalSpace(context.height*0.017),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:context.width*0.01),
            child: Text(
              description!,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}
