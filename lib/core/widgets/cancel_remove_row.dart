import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CancelRemoveRow extends StatelessWidget {
  final Function() onTap;
  const CancelRemoveRow({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: ()=>Navigator.pop(context),
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp
            ),
          ),
        ),
        HorizontalSpace(context.width*0.088),
        GestureDetector(
          onTap: onTap,
          child: Text(
            AppLocalizations.of(context)!.remove,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp
            ),
          ),
        ),
      ],
    );
  }
}
