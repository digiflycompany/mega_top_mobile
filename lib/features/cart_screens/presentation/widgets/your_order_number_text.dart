import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class YourOrderNumberText extends StatelessWidget {
  final String? orderNumber;
  const YourOrderNumberText({super.key, this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(context.height * 0.023),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.yourOrderNumberIs,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
            Text(
              orderNumber!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
          ],
        ),
      ],
    );
  }
}
