import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/spacer.dart';

class ProductSpecificationsRow extends StatelessWidget {
  final String? specification;
  final String? value;
  const ProductSpecificationsRow({super.key, this.specification, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Specification ///
         Text(
          specification!,
          style:  TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp
          ),
        ),
         HorizontalSpace(context.width*0.02),
         /// Value ///
         Text(
          value!,
          style:  TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp
          ),
        ),
      ],
    );
  }
}
