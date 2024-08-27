import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TotalPriceAmountRow extends StatelessWidget {
  final String? totalAmount;
  const TotalPriceAmountRow({
    super.key,
    this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Total Amount Text
        Text(
          AppLocalizations.of(context)!.totalAmount,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        ),
        const Spacer(),

        /// Total Amount
        Text(
          totalAmount!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        ),

        /// LE
        Text(
          AppLocalizations.of(context)!.le,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        )
      ],
    );
  }
}
