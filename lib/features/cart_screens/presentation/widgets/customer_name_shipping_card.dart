import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerNameShippingCard extends StatelessWidget {
  final String? name;
  const CustomerNameShippingCard({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name!,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
