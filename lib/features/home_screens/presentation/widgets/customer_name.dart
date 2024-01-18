import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class CustomerName extends StatelessWidget {
  final String? name;
  const CustomerName({super.key,  this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name!,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 12
          ),
        ),
        VerticalSpace(context.height*0.01),
        const Text(
          AppStrings.welcomeEn,
          style: TextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 12
          ),
        ),
      ],
    );
  }
}
