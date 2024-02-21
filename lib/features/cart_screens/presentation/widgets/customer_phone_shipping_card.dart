import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class CustomerPhoneShippingCard extends StatelessWidget {
  final String? phone;
  const CustomerPhoneShippingCard({super.key, this.phone});

  @override
  Widget build(BuildContext context) {
    return Text(
      phone!,
      style: TextStyle(
        color: AppColors.greyTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
