import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class OrderSuccessText extends StatelessWidget {
  const OrderSuccessText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(context.height * 0.033),
        Text(
          AppStrings.yourOrderReceivedSuccessfullyEn,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp),
        ),
      ],
    );
  }
}
