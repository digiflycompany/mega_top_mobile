import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderNumber extends StatelessWidget {
  final String? orderNumber;
  final Color? textColor;
  const OrderNumber({super.key, required this.orderNumber, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(end: 8.w),
      child: Row(
          children: [
            Text(AppLocalizations.of(context)!.orderId),
            /// Order Number
            Text(
              orderNumber!,
              style: TextStyle(
                color:textColor??Colors.black,
                fontWeight: FontWeight.w700,
                //fontSize: 14.sp
              ),
            ),
          ],
        ),
    );
  }
}
