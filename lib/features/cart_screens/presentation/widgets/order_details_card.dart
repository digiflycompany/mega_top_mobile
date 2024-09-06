import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'card_title_text.dart';
import 'custom_divider.dart';
import 'order_details_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.033),
      child: Container(
        width: double.infinity,
        height: context.height * 0.24,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(width: 1.w, color: AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTitleText(title: AppLocalizations.of(context)!.orderDetails,),
              CustomDivider(),
              OrderDetailsDescription(),
            ],
          ),
        ),
      ),
    );
  }
}
