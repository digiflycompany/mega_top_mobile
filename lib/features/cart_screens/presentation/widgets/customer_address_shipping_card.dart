import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';

class CustomerAddressShippingCard extends StatelessWidget {
  final String? address;
  const CustomerAddressShippingCard({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return Text(
      address!,
      style: TextStyle(
        color: AppColors.greyTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
