import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_routes_helper.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class ViewAllRow extends StatelessWidget {
  final String? bigText;
  const ViewAllRow({super.key, this.bigText});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        bigText!,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18.sp),
      ),
      const Spacer(),
      InkWell(
        onTap: () => pushRoute(Routes.offersScreen),
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
    ]);
  }
}