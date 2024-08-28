import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RemoveShippingDetailsContainer extends StatelessWidget {
  final Function()? editOnTap;
  const RemoveShippingDetailsContainer({super.key, this.editOnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: editOnTap,
      child: Row(
        children: [
          /// Remove Icon (Basket Icon)
          SvgPicture.asset(AppAssets.basketIcon),
          HorizontalSpace(context.width * 0.011),

          /// Remove Text
          Text(
            AppLocalizations.of(context)!.remove,
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
