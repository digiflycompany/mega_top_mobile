import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class ViewAllRow extends StatelessWidget {
  final String bigText;
  final bool? viewAllButton;
  final void Function()? onViewAllPressed;
  const ViewAllRow(
      {super.key,
      required this.bigText,
      this.viewAllButton,
      this.onViewAllPressed});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        bigText,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.sp),
      ),
      if (viewAllButton == true) ...[
        const Spacer(),
        InkWell(
            onTap: onViewAllPressed,
            child: Row(children: [
              Text(AppLocalizations.of(context)!.viewAll,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp)),
              Gap(context.width * 0.022),
              Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor, size: 13.sp)
            ]))
      ]
    ]);
  }
}