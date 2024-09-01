import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotAvailableContainer extends StatelessWidget {
  const NotAvailableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w
      ),
      height: context.height * 0.033,
      decoration: BoxDecoration(
          color: AppColors.smallContainerGreyColor,
          borderRadius: BorderRadius.circular(context.height * 0.003)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.outOfStock,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 11.sp),
          )
        ],
      ),
    );
  }
}
