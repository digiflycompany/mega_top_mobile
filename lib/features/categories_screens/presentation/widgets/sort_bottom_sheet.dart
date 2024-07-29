import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_radio_button.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import 'bottom_sheet_app_bar.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CategoryCubit>(context),
      child: Container(
          height: context.height * 0.372,
          color: Colors.white,
          child: Column(
            children: [
              const BottomSheetAppBar(AppStrings.sortByEn),
              VerticalSpace(context.height * 0.033),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
                child: Column(
                  children: [
                     SortBottomSheetAdaptiveRadioButton(
                      value: AppStrings.defaultEn,
                      label: AppStrings.defaultEn,
                      description: '',
                      onTap:(){
                        context.read<CategoryCubit>().page = 1;
                        context.read<CategoryCubit>().getSelectedCategories(context.read<CategoryCubit>().selectedCategoryId!);
                      } ,
                    ),
                    VerticalSpace(context.height * 0.01),
                     SortBottomSheetAdaptiveRadioButton(
                      value: AppStrings.fromHighToLowEn,
                      label: AppStrings.priceEn,
                      description: AppStrings.fromHighToLowEn,
                       onTap: context.read<CategoryCubit>().sortingFromHighPrice,
                    ),
                    VerticalSpace(context.height * 0.01),
                    SortBottomSheetAdaptiveRadioButton(
                      value: AppStrings.fromLowToHighEn,
                      label: AppStrings.price2En,
                      description: AppStrings.fromLowToHighEn,
                      onTap: context.read<CategoryCubit>().sortingFromLowPrice,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
