import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/added_to_cart_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_state.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_repo.dart';
import 'package:mega_top_mobile/features/categories_screens/data/product_details_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/selected_categories_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/subcategories_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/your_orders_model.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_bottom_sheet.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  CategoryCubit getCubit(context) => BlocProvider.of(context);
  bool isGrid = true;
  bool noResult = false;
  bool addedToFavourites = false;
  bool addedToCompare = false;
  String _selectedValue = AppStrings.defaultEn;
  String? selectedCategoryName;
  final List<String>? placeHolderImages = [
    AppAssets.megaTop2Logo,
  ];
  String get selectedValue => _selectedValue;
  List<bool> checkboxStates = [];
  CategoriesRepo categoriesRepo = new CategoriesRepoImp();

  late String? selectedCategoryId;

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
    // categoriesRepo.addToWishList("1987",
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21lZ2F0b3AuY29tLmVnIiwiaWF0IjoxNzExMjk0NTc1LCJuYmYiOjE3MTEyOTQ1NzUsImV4cCI6MTcxMTg5OTM3NSwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMTQifX19.iy3gvBgYShSO4U16q1LTQ5Xo5cii2M5rxAEy3TLyiPY");
    emit(CategoryInitial());
  }

  void toggleCompare() {
    addedToCompare = !addedToCompare;
    emit(CategoryInitial());
  }

  void initializeCheckboxes(int subCategoriesLength) {
    checkboxStates = List.filled(subCategoriesLength, false);
    emit(CategoryUpdated());
  }

  void setImageIndex(int index) {
    _currentImageIndex = index;
  }

  void toggleCheckbox(int index) {
    checkboxStates[index] = !checkboxStates[index];
    emit(CategoryUpdated());
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
        return SortBottomSheet(
          onTapDefault: () {
            page = 1;
            getSelectedCategories(selectedCategoryId!);
          },
          onTapFromHighPrice: () {
            sortingFromHighPrice();
          },
          onTapFromLowPrice: () {
            sortingFromLowPrice();
          },
          cubit: getCubit(context),
        );
      }
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
        return FractionallySizedBox(
          heightFactor: 1.0, // For full screen height
          child: FilterBottomSheet(
            cubit: getCubit(context),
            getProductsFunction: () {
              getSelectedCategories(selectedCategoryId!);
            },
          ),
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

  CategoriesModel? categoriesModel;

  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      CategoriesModel? fetchedCategories = await categoriesRepo.getCategories();
      if (fetchedCategories != null && fetchedCategories.success == true) {
        categoriesModel = fetchedCategories;
        print(categoriesModel);
        emit(CategorySuccess());
      } else {
        //emit(CategoryFailure('No categories found'));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(CategoryNoInternetConnection());
      } else {
        emit(CategoryFailure(e.toString()));
      }
    }
  }

  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  int page = 1;
  int? minPrice;
  int? maxPrice;

  SelectedCategoryModel? selectedCategoryModel;

  Future<void> getSelectedCategories(String selectedId) async {
    emit(SelectedCategoryLoading());
    try {
      selectedCategoryModel = null;
      SelectedCategoryModel? fetchedCategories =
          await categoriesRepo.getSelectedCategories(
        selectedCategory: selectedId,
        page: page,
        minPrice: minPrice,
        maxPrice: maxPrice,
        subCategories: subCategoriesQuery(),
      );
      if (fetchedCategories != null && fetchedCategories.success == true) {
        selectedCategoryModel = fetchedCategories;
        emit(SelectedCategorySuccess());
      } else {
        emit(SelectedCategoryNoInternetConnection());
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(SelectedCategoryNoInternetConnection());
      } else {
        emit(SelectedCategoryFailure(e.toString()));
      }
    }
  }

  bool? hasMoreProducts = false;

  Future<void> getMoreProduct(String selectedId) async {
    emit(SelectedCategoryMoreProductsLoading());
    try {
      SelectedCategoryModel? moreProducts =
          await categoriesRepo.getSelectedCategories(
              selectedCategory: selectedId,
              page: page,
              minPrice: minPrice,
              maxPrice: maxPrice);
      if (moreProducts != null && moreProducts.success == true) {
        selectedCategoryModel!.data!.products
            .addAll(moreProducts.data!.products);
        hasMoreProducts = moreProducts.data!.products.isNotEmpty;
        print("hasMoreProducts");
        print(hasMoreProducts);
        emit(SelectedCategoryMoreProductsSuccess());
      } else {
        emit(SelectedCategoryMoreProductsNoInternetConnection());
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(SelectedCategoryMoreProductsNoInternetConnection());
      } else {
        emit(SelectedCategoryMoreProductsFailure(e.toString()));
      }
    }
  }

  List<String> subCategoriesQuery() {
    List<String> subCategoriesList = [];

    for (int i = 0; i < checkboxStates.length - 1; i++) {
      if (checkboxStates[i] == true) {
        subCategoriesList.add(subCategoriesModel!.data!.subcategories[i].id!);
      }
    }
    return subCategoriesList;
  }

  int selectedProductIndex = 0;

  void setCategoryProductIndex({required int selectedProductIndex}) {
    this.selectedProductIndex = selectedProductIndex;
  }

  void sortingFromHighPrice() {
    selectedCategoryModel!.data!.products
        .sort((a, b) => b.price.finalPrice.compareTo(a.price.finalPrice));
  }

  void sortingFromLowPrice() {
    selectedCategoryModel!.data!.products
        .sort((a, b) => a.price.finalPrice.compareTo(b.price.finalPrice));
  }

  int getDiscountPercentage({
    required int finalPrice,
    required int originPrice,
  }) {
    // Check if the final price is zero or greater than or equal to the original price
    if (finalPrice >= originPrice || originPrice == 0) {
      return 0;
    }

    // Calculate the discount percentage
    int discountPercentage = ((originPrice - finalPrice) * 100) ~/ originPrice;

    // Ensure the result is between 0% and 100%
    return discountPercentage.clamp(0, 100);
  }

  // Future<void> addToCart(int customerId, int productId, int quantity) async {
  //   emit(addToCartLoading());
  //   try {
  //     categoriesRepo.makeOrder(customerId, productId, quantity);
  //     emit(addToCartSuccess());
  //   } catch (e) {
  //     emit(addToCartFailure(e.toString()));
  //   }
  // }
  SubCategoriesModel? subCategoriesModel;

  Future<void> getSubCategories(String categoriesId) async {
    emit(SubCategoryLoading());
    try {
      subCategoriesModel = null;
      SubCategoriesModel? fetchedSubCategories =
          await categoriesRepo.getSubCategories(categoryId: categoriesId);
      if (fetchedSubCategories != null &&
          fetchedSubCategories.success == true) {
        subCategoriesModel = fetchedSubCategories;
        emit(SubCategorySuccess());
      } else {
        emit(SubCategoryNoInternetConnection());
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(SubCategoryNoInternetConnection());
      } else {
        emit(SubCategoryFailure(e.toString()));
      }
    }
  }

  // Future<void> addToCart(int customerId, int productId, int quantity) async {
  //   emit(addToCartLoading());
  //   try {
  //     categoriesRepo.makeOrder(customerId, productId, quantity);
  //     emit(addToCartSuccess());
  //   } catch (e) {
  //     emit(addToCartFailure(e.toString()));
  //   }
  // }

  OrderList? orders;

  // Future<void> getMyOrders(int customerID) async {
  //   emit(myOrdersLoading());
  //   try {
  //     orders = await categoriesRepo.getMyOrders(customerID);
  //     if (orders!.isNotNull) {
  //       emit(myOrdersSuccess());
  //     } else {
  //       emit(myOrdersFailure('No categories found'));
  //     }
  //   } catch (e) {
  //     emit(myOrdersFailure(e.toString()));
  //   }
  // }
  // Future<void> getMyOrders(int customerID) async {
  //   emit(myOrdersLoading());
  //   try {
  //     orders = await categoriesRepo.getMyOrders(customerID);
  //     if (orders!.isNotNull) {
  //       emit(myOrdersSuccess());
  //     } else {
  //       emit(myOrdersFailure('No categories found'));
  //     }
  //   } catch (e) {
  //     emit(myOrdersFailure(e.toString()));
  //   }
  // }

  ProductDetailsModel? productDetailsModel;

  Future<void> getProductsDetails(int productID) async {
    emit(productDetailsLoading());
    try {
      productDetailsModel = await categoriesRepo.getProductDetails(productID);
      if (productDetailsModel!.isNotNull) {
        print(productDetailsModel);
        print('ssssssssssssssssssssssssssssssssssssssssaaassssssssssssssssss');
        emit(productDetailsSuccess());
      } else {
        emit(productDetailsFailure('No categories found'));
      }
    } catch (e) {
      emit(productDetailsFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}