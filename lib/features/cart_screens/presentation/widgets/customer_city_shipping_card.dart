import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class CustomerCityShippingCard extends StatelessWidget {
  final String? city;
  const CustomerCityShippingCard({super.key, this.city});

  @override
  Widget build(BuildContext context) {
    return Text(
      "City: $city",
      style: TextStyle(
        color: AppColors.greyTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
