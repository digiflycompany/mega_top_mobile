import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../presentation/widgets/bottom_sheet_app_bar.dart';
import '../presentation/widgets/sort_radio_button.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  CategoryCubit getCubit(context) => BlocProvider.of(context);

  bool isGrid = true;

  bool noResult = false;

  String _selectedValue = AppStrings.defaultEn;


  String get selectedValue => _selectedValue;

  void selectOption(String newValue) {
    _selectedValue = newValue;
    emit(CategoryUpdated());
  }

  void toggleList() {
    isGrid = !isGrid;
    emit(CategoryInitial());
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      builder: (_) {
        return Container(
          height: context.height*0.372,
          color: Colors.white,
          child: Column(
            children: [
              const BottomSheetAppBar(AppStrings.sortByEn),
              VerticalSpace(context.height*0.033),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
                child:  Column(
                  children: [
                    const CustomAdaptiveRadioButton(
                      value: AppStrings.defaultEn,
                      label: AppStrings.defaultEn,
                      description: '',
                    ),
                    VerticalSpace(context.height*0.01),
                    const CustomAdaptiveRadioButton(
                      value: AppStrings.priceEn,
                      label: AppStrings.priceEn,
                      description: AppStrings.fromHighToLowEn,
                    ),
                    VerticalSpace(context.height*0.01),
                    const CustomAdaptiveRadioButton(
                      value: AppStrings.priceEn,
                      label: AppStrings.priceEn,
                      description: AppStrings.fromLowToHighEn,
                    ),
                  ],
                ),
              ),

            ],
          )
        );
      },
    );
  }

}
