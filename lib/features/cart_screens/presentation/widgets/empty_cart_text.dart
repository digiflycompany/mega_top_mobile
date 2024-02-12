import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_string.dart';

class EmptyCartText extends StatelessWidget {
  const EmptyCartText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.yourShoppingCartIsEmptyEn,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp
          ),
        ),
      ],
    );
  }
}
