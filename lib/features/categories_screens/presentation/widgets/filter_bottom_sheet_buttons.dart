import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/functions/show_error_toast.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterBottomSheetButtons extends StatelessWidget {
  const FilterBottomSheetButtons(
      {super.key,
      required this.getProductsFunction,
      required this.cubit,
      this.brand});

  final Function getProductsFunction;
  final cubit;
  final bool? brand;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
        builder: (BuildContext context, CategoryState state) {
      //   final cubit = CategoryCubit().getCubit(context);
      return Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.022),
          child: Column(children: [
            PrimaryButton(
                content: Text(AppLocalizations.of(context)!.apply,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp)),
                onTap: () {
                  if (cubit.minPriceController.text.trim().isEmpty &&
                      cubit.maxPriceController.text.trim().isEmpty) {
                    showErrorToast(
                        context,
                        AppLocalizations.of(context)!.filterError,
                        AppLocalizations.of(context)!
                            .pleaseEnterFilterBoundaries);
                    return null;
                  }

                  // Check if the last character is an integer
                  final minLastChar = cubit.minPriceController
                      .text[cubit.minPriceController.text.length - 1];
                  final maxLastChar = cubit.maxPriceController
                      .text[cubit.maxPriceController.text.length - 1];
                  if (int.tryParse(minLastChar) == null ||
                      int.tryParse(maxLastChar) == null) {
                    showErrorToast(
                        context,
                        AppLocalizations.of(context)!.filterError,
                        AppLocalizations.of(context)!.lastCharMustBeANumber);
                    return null;
                  }

                  // Check for multiple decimal points
                  if (cubit.minPriceController.text.split('.').length - 1 > 1 ||
                      cubit.maxPriceController.text.split('.').length - 1 > 1) {
                    showErrorToast(
                        context,
                        AppLocalizations.of(context)!.filterError,
                        AppLocalizations.of(context)!
                            .onlyOneDecimalPointIsAllowed);
                    return null;
                  }

                  if (minLastChar == '.' || maxLastChar == '.') {
                    showErrorToast(
                        context,
                        AppLocalizations.of(context)!.filterError,
                        AppLocalizations.of(context)!
                            .lastCharMustNotBeADecimalPoint);
                    return null;
                  }
                  if ((cubit.minPriceController.text as String)
                          .isNotNullOrEmpty &&
                      (cubit.maxPriceController.text as String)
                          .isNotNullOrEmpty) {
                    if (num.tryParse(cubit.minPriceController.text)! >
                        num.tryParse(cubit.maxPriceController.text)!) {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!.priceValidation,
                          toastLength: Toast.LENGTH_SHORT,
                          textColor: Colors.white,
                          fontSize: 12.sp);
                    } else {
                      cubit.page = 1;
                      cubit.minPrice =
                          num.tryParse(cubit.minPriceController.text);
                      cubit.maxPrice =
                          num.tryParse(cubit.maxPriceController.text);
                      cubit.selectOption(AppStrings.defaultEn);
                      //   cubit.getSelectedCategories(cubit.selectedCategoryId!);
                      getProductsFunction();
                      Navigator.pop(context);
                    }
                  } else {
                    cubit.page = 1;
                    cubit.minPrice =
                        num.tryParse(cubit.minPriceController.text);
                    cubit.maxPrice =
                        num.tryParse(cubit.maxPriceController.text);
                    cubit.selectOption(AppStrings.defaultEn);
                    //   cubit.getSelectedCategories(cubit.selectedCategoryId!);
                    getProductsFunction();
                    Navigator.pop(context);
                  }
                }),
            VerticalSpace(context.height * 0.033),
            PrimaryOutlinedButton(
                onTap: () {
                  cubit.page = 1;
                  cubit.minPriceController.clear();
                  cubit.maxPriceController.clear();
                  cubit.minPrice = null;
                  cubit.maxPrice = null;
                  if (brand != true)
                    cubit.initializeCheckboxes(
                        cubit.subCategoriesModel!.data!.subcategories.length);
                  cubit.selectOption(AppStrings.defaultEn);
                  getProductsFunction();
                  Navigator.pop(context);
                },
                text: AppLocalizations.of(context)!.reset)
          ]));
    });
  }
}