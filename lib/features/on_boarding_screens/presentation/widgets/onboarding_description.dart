import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
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
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700
            ),
          ),
          VerticalSpace(context.height*0.017),
          Text(
            description!,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
