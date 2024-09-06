import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/price_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key, required this.minPriceController, required this.maxPriceController});

  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            AppLocalizations.of(context)!.price2,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
            ),
          ),
        ),
        VerticalSpace(context.height * 0.032),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.from,
              style: TextStyle(
                  color: AppColors.smallTextBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp),
            ),
            Expanded(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.to,
                  style: TextStyle(
                      color: AppColors.smallTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp),
                ),
              ),
            )
          ],
        ),
        VerticalSpace(context.height * 0.022),
        Row(
          children: [
            PriceTextField(price: minPriceController),
            Spacer(),
            PriceTextField(price: maxPriceController),
          ],
        ),
      ],
    );
  }
}
