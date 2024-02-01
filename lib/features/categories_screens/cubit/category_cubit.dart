import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';

import '../presentation/widgets/bottom_sheet_app_bar.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  CategoryCubit getCubit(context) => BlocProvider.of(context);

  bool isGrid = true;

  bool noResult = false;


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
          child:  const Column(
            children: [
              BottomSheetAppBar(AppStrings.sortByEn),
            ],
          )
        );
      },
    );
  }

}
