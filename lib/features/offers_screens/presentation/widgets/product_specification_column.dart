import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/product_specifications_row.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';

class ProductSpecificationColumn extends StatelessWidget {
  const ProductSpecificationColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            AppStrings.productSpecificationEn,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
        ),
        VerticalSpace(context.height * 0.021),
        Divider(
          thickness: context.width * 0.003,
          color: AppColors.smallContainerGreyColor,
        ),
        VerticalSpace(context.height * 0.021),
        const ProductSpecificationsRow(
          specification: AppStrings.mainInputVoltageEn,
          value: AppStrings.volts230En,
        ),
        VerticalSpace(context.height * 0.021),
        const ProductSpecificationsRow(
          specification: AppStrings.mainOutputVoltageEn,
          value: AppStrings.volts230En,
        ),
        VerticalSpace(context.height * 0.021),
        const ProductSpecificationsRow(
          specification: AppStrings.batteryRechargingTimeEn,
          value: AppStrings.volts230En,
        )
      ],
    );
  }
}
