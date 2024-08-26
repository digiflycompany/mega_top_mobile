import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/locale/locale_cubit.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AvailableContainer extends StatelessWidget {
  const AvailableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.2,
      height: context.height * 0.033,
      decoration: BoxDecoration(
          color: AppColors.smallContainerGreyColor,
          borderRadius: BorderRadius.circular(context.height * 0.003)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.smallCheckIcon),
          HorizontalSpace(context.width * 0.011),
          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return Text(
                AppLocalizations.of(context)!.available,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp),
              );
            },
          )
        ],
      ),
    );
  }
}
