import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EditShippingDetailsContainer extends StatelessWidget {
  final Function()? onTap;
  const EditShippingDetailsContainer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.editSmallIcon),
          HorizontalSpace(context.width * 0.011),
          Text(
            AppLocalizations.of(context)!.edit,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
