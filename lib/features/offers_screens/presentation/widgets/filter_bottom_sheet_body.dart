import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/filter_bottom_sheet_buttons.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/price_container.dart';

class FilterBottomSheetBody extends StatelessWidget {
  const FilterBottomSheetBody({super.key, required this.getProductsFunction ,required this.cubit});

  final Function getProductsFunction;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: Column(
          children: [
            // Align(
            //   alignment: AlignmentDirectional.topStart,
            //   child: Text(
            //     AppStrings.brandEn,
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.w700,
            //       fontSize: 15.sp,
            //     ),
            //   ),
            // ),
            // VerticalSpace(context.height * 0.02),
          //  const BrandsCheckList(),
            VerticalSpace(context.height * 0.025),
            PriceContainer(minPriceController: cubit.minPriceController,maxPriceController: cubit.maxPriceController,),
            const Spacer(),
            FilterBottomSheetButtons(
              getProductsFunction: getProductsFunction,
              cubit: cubit,
            ),
          ],
        ),
      ),
    );
  }
}
