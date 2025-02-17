import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/brands_checklist.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet_buttons.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/price_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterBottomSheetBody extends StatelessWidget {
  const FilterBottomSheetBody(
      {super.key,
      required this.getProductsFunction,
      required this.cubit,
      this.brand});

  final Function getProductsFunction;
  final cubit;
  final bool? brand;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: [
                  if (brand != true) ...[
                    Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(AppLocalizations.of(context)!.brand,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp))),
                    VerticalSpace(context.height * 0.02),
                    if (cubit.subCategoriesModel.data.subcategories.length > 0)
                      const BrandsCheckList(),
                    VerticalSpace(context.height * 0.025)
                  ],
                  PriceContainer(
                      minPriceController: cubit.minPriceController,
                      maxPriceController: cubit.maxPriceController),
                  VerticalSpace(context.height * 0.025),
                  FilterBottomSheetButtons(
                      getProductsFunction: getProductsFunction, cubit: cubit, brand: brand)
                ]))));
  }
}