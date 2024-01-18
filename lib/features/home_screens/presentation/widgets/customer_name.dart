import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class CustomerName extends StatelessWidget {
  const CustomerName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.customerNameEn,
          style: TextStyle(
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
