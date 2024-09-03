import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterBottomSheetButtonsInSearch extends StatelessWidget {
  const FilterBottomSheetButtonsInSearch({super.key, required this.getProductsFunction,required this.cubit});

  final Function getProductsFunction;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (BuildContext context, HomeState state) {
     //   final cubit = HomeCubit().getCubit(context);
        return Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.022),
          child: Column(
            children: [
              PrimaryButton(
                content: Text(
                  AppLocalizations.of(context)!.apply,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
                onTap: (){
                  if((cubit.minPriceController.text as String).isNotNullOrEmpty && (cubit.maxPriceController.text as String).isNotNullOrEmpty)
                  {
                    if(int.tryParse(cubit.minPriceController.text)! > int.tryParse(cubit.maxPriceController.text)!)
                    {
                      Fluttertoast.showToast(
                          msg: "Minimum price cannot be greater than the maximum price",
                          toastLength: Toast.LENGTH_SHORT,
                          textColor: Colors.white,
                          fontSize: 12.sp
                      );
                    }else{
                      cubit.page = 1;
                      cubit.minPrice = int.tryParse(cubit.minPriceController.text);
                      cubit.maxPrice = int.tryParse(cubit.maxPriceController.text);
                      cubit.selectOption(AppStrings.defaultEn);
                      //   cubit.getSelectedCategories(cubit.selectedCategoryId!);
                      getProductsFunction();
                      Navigator.pop(context);
                    }
                  }
                  else{
                    cubit.page = 1;
                    cubit.minPrice = int.tryParse(cubit.minPriceController.text);
                    cubit.maxPrice = int.tryParse(cubit.maxPriceController.text);
                    cubit.selectOption(AppStrings.defaultEn);
                    //   cubit.getSelectedCategories(cubit.selectedCategoryId!);
                    getProductsFunction();
                    Navigator.pop(context);
                  }
                },
              ),
              VerticalSpace(context.height * 0.033),
              PrimaryOutlinedButton(
                onTap: (){
                  cubit.page = 1;
                  cubit.minPriceController.clear();
                  cubit.maxPriceController.clear();
                  cubit.minPrice = null;
                  cubit.maxPrice = null;
                  cubit.selectOption(AppStrings.defaultEn);
                  //    cubit.getSelectedCategories(cubit.selectedCategoryId!);
                  getProductsFunction();
                  Navigator.pop(context);
                },
                text: AppLocalizations.of(context)!.reset,
              ),
            ],
          ),
        );
      },
    );
  }
}
