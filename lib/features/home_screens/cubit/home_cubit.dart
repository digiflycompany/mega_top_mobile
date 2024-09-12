import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/features/categories_screens/data/subcategories_model.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/latest_offer_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/latest_product_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/search_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/search_repo.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/filter_bottom_sheet_in_search.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/sort_bottom_sheet_in_search.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeCubit getCubit(context) => BlocProvider.of(context);
  final List<String>? placeHolderImages=[
    AppAssets.megaTop2Logo,
  ];
  bool isGrid = true;

  bool noResult = false;

  //HomePageRepo homePageRepo = new HomePageRepoImp();

  void setImageAdsIndex(int index) {
    emit(ImageChanged(index: index));
  }

  void setPageIndex(int index) {
    emit(HomePageChanged(index: index));
  }

  void toggleList() {
    isGrid = !isGrid;
    emit(HomeInitial());
  }

  void toggleNoResult() {
    noResult = !noResult;
    emit(HomeInitial());
  }

  UserModel? userDetails;
  List<LatestProductsModel> latestProducts = [];

  // Future<void> getLatestProducts() async {
  //   emit(LatestProductLoading());
  //   try {
  //     List<LatestProductsModel>? fetchedLatestProducts =
  //     await homePageRepo.getLatestProduct();
  //     if (fetchedLatestProducts != null && fetchedLatestProducts.isNotEmpty) {
  //       latestProducts = fetchedLatestProducts;
  //       print('Fetched products: $latestProducts');
  //       emit(LatestProductSuccess());
  //     } else {
  //       emit(LatestProductFailure('No products found or empty response.'));
  //     }
  //   } catch (e) {
  //     emit(LatestProductFailure(e.toString()));
  //   }
  // }

  LatestOfferModel? latestOfferModel;
  // Future<LatestOfferModel?> getLastOffers() async {
  //   emit(LatestOfferLoading());
  //   try {
  //     latestOfferModel = await HomePageRepoImp().getLastOffers();
  //     if (latestOfferModel!.latestOfferList.isNotEmpty) {
  //       emit(LatestOfferSuccess());
  //     } else {
  //       emit(LatestOfferFailure('no latest offer found'));
  //     }
  //   } catch (e) {
  //     emit(LatestOfferFailure(e.toString()));
  //   }
  //   return null;
  // }
  // Future<void> getLatestProducts() async {
  //   emit(LatestProductLoading());
  //   try {
  //     List<LatestProductsModel>? fetchedLatestProducts = await homePageRepo.getLatestProduct();
  //     if (fetchedLatestProducts != null) {
  //       if (fetchedLatestProducts.isNotEmpty) {
  //         latestProducts = fetchedLatestProducts;
  //         print('Successfully fetched products');
  //         emit(LatestProductSuccess());
  //       } else {
  //         print('No products found');
  //         emit(LatestProductFailure('No products found'));
  //       }
  //     } else {
  //       print('Failed to fetch products or received null');
  //       emit(LatestProductFailure('Error fetching products'));
  //     }
  //   } catch (e) {
  //     print('Error in getLatestProducts: $e');
  //     emit(LatestProductFailure(e.toString()));
  //   }
  // }


  List< bool> checkboxStates = [];

  void initializeCheckboxes(int subCategoriesLength) {
    checkboxStates= List.filled(subCategoriesLength, false);
    emit(HomeUpdated());
  }

  void toggleCheckbox(int index) {
    checkboxStates[index] = !checkboxStates[index];
    emit(HomeUpdated());
  }

  List<String> subCategoriesQuery(){
    List<String> subCategoriesList=[];

    for(int i=0;i<checkboxStates.length-1;i++)
    {
      if(checkboxStates[i] == true)
      {
        subCategoriesList.add(subCategoriesModel!.data!.subcategories[i].id!);
      }
    }
    return subCategoriesList;
  }

  SubCategoriesModel? subCategoriesModel;

  // Future<void> getSubCategories(String categoriesId) async {
  //   emit(SubCategoryLoading());
  //   try {
  //     subCategoriesModel = null;
  //     subCategoriesModel = await searchRepo.getSubCategories(
  //         categoryId: categoriesId);
  //     emit(SubCategorySuccess());
  //   } catch (e) {
  //     print(e.toString() + "///////");
  //     emit(SubCategoryFailure(e.toString()));
  //   }
  // }

  int _currentImageIndex = 0;

  int get currentImageIndex => _currentImageIndex;

  void setImageIndex(int index) {
    _currentImageIndex = index;
    emit(HomeUpdated());
  }

  String _selectedValue = AppStrings.defaultEn;

  String get selectedValue => _selectedValue;


  void selectOption(String newValue) {
    _selectedValue = newValue;
    emit(HomeUpdated());
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


  int selectedProductIndex = 0;

  void setCategoryProductIndex({required int selectedProductIndex}) {
    this.selectedProductIndex = selectedProductIndex;
  }


  SearchRepo searchRepo = new CategoriesRepoImp();

  SearchModel? searchModel;


  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  int page = 1;
  int? minPrice;
  int? maxPrice;

  TextEditingController searchWord = TextEditingController();


  Future<void> search() async {
    emit(SearchLoading());
    try {
      searchModel = null;
      SearchModel? fetchedProducts = await searchRepo.getSearch(
        searchWord: searchWord.text,
        page: page,
        minPrice: minPrice,
        maxPrice: maxPrice,
        subCategories: subCategoriesQuery()
      );
      if (fetchedProducts != null && fetchedProducts.success==true) {
        searchModel = fetchedProducts;
        emit(SearchSuccess());
      }else {
        emit(SearchNoInternetConnection());
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(SearchNoInternetConnection());
      }else {
        emit(SearchFailure(e.toString()));
      }
    }
  }

  void sortingFromHighPrice() {
    searchModel!.data!.products
        .sort((a, b) => b.price.finalPrice.compareTo(a.price.finalPrice));
  }

  void sortingFromLowPrice() {
    searchModel!.data!.products
        .sort((a, b) => a.price.finalPrice.compareTo(b.price.finalPrice));
  }


  bool? hasMoreProducts = false;

  Future<void> getMoreProduct() async {
    emit(SearchMoreProductsLoading());
    try {
      SearchModel? moreProducts =
      await searchRepo.getSearch(
          page: page,
          minPrice: minPrice,
          maxPrice: maxPrice, searchWord: searchWord.text);
      if (moreProducts != null && moreProducts.success==true) {
        searchModel!.data!.products
            .addAll(moreProducts.data!.products);
        hasMoreProducts = moreProducts.data!.products.isNotEmpty;
        print("hasMoreProducts");
        print(hasMoreProducts);
        emit(SearchMoreProductsSuccess());
      }else{
        emit(SearchMoreProductsNoInternetConnection());
      }

    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(SearchMoreProductsNoInternetConnection());
      }else {
        emit(SearchMoreProductsFailure(e.toString()));
      }
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
        return SortBottomSheetInSearch(
          onTapDefault: () {
            page = 1;
            search();
          },
          onTapFromHighPrice: () {
            sortingFromHighPrice();
          },
          onTapFromLowPrice: (){
            sortingFromLowPrice();
          },
          cubit: getCubit(context),
        );
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
        return FractionallySizedBox(
          heightFactor: 1.0, // For full screen height
          child: FilterBottomSheetInSearch(
            cubit: getCubit(context),
            getProductsFunction: (){
              search();
            },
          ),
        );
      },
    );
  }
  void showErrorToast(BuildContext context, String title, String text) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: CustomErrorToast(
          title: title,
          message: text,
          color: AppColors.redIconColor,
          onDismissed: () {
            if (overlayEntry != null) {
              overlayEntry!.remove();
              overlayEntry = null;
            }
          },
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
  }

  @override
  Future<void> close() {();
    return super.close();
  }

}
