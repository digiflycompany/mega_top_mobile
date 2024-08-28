import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomerCityShippingCard extends StatelessWidget {
  final String? city;
  const CustomerCityShippingCard({super.key, this.city});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.city,
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          city!,
          style: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
