import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/added_to_cart_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_repo.dart';
import 'package:mega_top_mobile/features/categories_screens/data/selected_categories_model.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_bottom_sheet.dart';

import '../../../core/utils/app_assets.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  CategoryCubit getCubit(context) => BlocProvider.of(context);

  bool isGrid = true;
  bool noResult = false;
  bool addedToFavourites = false;
  bool addedToCompare = false;
  String _selectedValue = AppStrings.defaultEn;

  String get selectedValue => _selectedValue;
  final Map<String, bool> checkboxStates = {};
  CategoriesRepo categoriesRepo = new CategoriesRepoImp();
  CategoriesModel? categoriesModel;

  late int? selectedCategoryId;

  final List<String> images = [
    AppAssets.productBigPhoto,
    AppAssets.productBigPhotoRight,
    AppAssets.productBigPhoto,
  ];
  int _currentImageIndex = 0;

  int get currentImageIndex => _currentImageIndex;

  void selectOption(String newValue) {
    _selectedValue = newValue;
    emit(CategoryUpdated());
  }

  void toggleList() {
    isGrid = !isGrid;
    emit(CategoryInitial());
  }

  void toggleFavourite() {
    addedToFavourites = !addedToFavourites;
    emit(CategoryInitial());
  }

  void toggleCompare() {
    addedToCompare = !addedToCompare;
    emit(CategoryInitial());
  }

  void initializeCheckboxes(List<String> items) {
    for (var item in items) {
      checkboxStates[item] = false;
    }
    emit(CategoryUpdated());
  }

  void setImageIndex(int index) {
    _currentImageIndex = index;
    emit(CategoryProductUpdated());
  }

  void toggleCheckbox(String item) {
    if (checkboxStates.containsKey(item)) {
      checkboxStates[item] = !checkboxStates[item]!;
      emit(CategoryUpdated());
    }
  }

  void showSortBottomSheet(BuildContext context) {
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
        return const SortBottomSheet();
      },
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      builder: (BuildContext context) {
        return const FractionallySizedBox(
          heightFactor: 1.0, // For full screen height
          child: FilterBottomSheet(),
        );
      },
    );
  }

  void showAddedToCartBottomSheet(BuildContext context) {
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
        return const AddToCartBottomSheet();
      },
    );
  }

  /// Get Categories
  List<CategoriesModel> categories = [];

  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      List<CategoriesModel>? fetchedCategories =
          await categoriesRepo.getCategories();
      if (fetchedCategories!.isNotEmpty) {
        categories = fetchedCategories;

        emit(CategorySuccess());
      } else {
        emit(CategoryFailure('No categories found'));
      }
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }

  SelectedCategoriesModel? selectedCategoriesModel;

  Future<void> getSelectedCategories(int selectedId) async {
    emit(SelectedCategoryLoading());
    try {
      selectedCategoriesModel =
          await categoriesRepo.getSelectedCategories(selectedId);
      print(selectedCategoriesModel!.productList[0].images[0].src + "///////");
      emit(SelectedCategorySuccess());
    } catch (e) {
      print(e.toString() + "///////");
      emit(SelectedCategoryFailure(e.toString()));
    }
  }
}
