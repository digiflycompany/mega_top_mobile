import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_empty_button.dart';

class FilterBottomSheetButtons extends StatelessWidget {
  const FilterBottomSheetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit,CategoryState>(
      builder: (BuildContext context, CategoryState state) {
        final cubit = context.read<CategoryCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.022),
          child: Column(
            children: [
              PrimaryButton(
                text: AppStrings.applyEn,
                onTap: (){
                  if(cubit.minPriceController.value.text.isEmptyOrNull || cubit.maxPriceController.value.text.isEmptyOrNull)
                    {

                    }
                  else if(int.tryParse(cubit.minPriceController.text)! > int.tryParse(cubit.maxPriceController.text)!)
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
                    cubit.getSelectedCategories(cubit.selectedCategoryId!);
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
                  cubit.getSelectedCategories(cubit.selectedCategoryId!);
                  Navigator.pop(context);
                  },
                text: AppStrings.resetEn,
              ),
            ],
          ),
        );
      },
    );
  }
}
