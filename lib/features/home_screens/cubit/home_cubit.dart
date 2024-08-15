import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/subcategories_model.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/latest_offer_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/latest_product_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/search_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/search_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeCubit getCubit(context) => BlocProvider.of(context);

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

  Future<void> getSubCategories(String categoriesId) async {
    emit(SubCategoryLoading());
    try {
      subCategoriesModel = null;
      subCategoriesModel = await searchRepo.getSubCategories(
          categoryId: categoriesId);
      emit(SubCategorySuccess());
    } catch (e) {
      print(e.toString() + "///////");
      emit(SubCategoryFailure(e.toString()));
    }
  }

  int _currentImageIndex = 0;

  int get currentImageIndex => _currentImageIndex;

  void setImageIndex(int index) {
    _currentImageIndex = index;
    emit(HomeUpdated());
  }


  String _selectedValue = AppStrings.defaultEn;

  void selectOption(String newValue) {
    _selectedValue = newValue;
    emit(HomeUpdated());
  }

  int getDiscountPercentage(
      {required int finalPrice, required int originPrice}) {
    return 1 - finalPrice ~/ originPrice;
  }

  int selectedProductIndex = 0;

  void setCategoryProductIndex({required int selectedProductIndex}) {
    this.selectedProductIndex = selectedProductIndex;
  }


  SearchRepo searchRepo = new CategoriesRepoImp();

  SearchModel? searchModel;

  int page = 1;
  int? minPrice;
  int? maxPrice;

  TextEditingController searchWord = TextEditingController();


  Future<void> search() async {
    emit(SearchLoading());
    try {
      searchModel = null;
      searchModel = await searchRepo.getSearch(
        searchWord: searchWord.text,
        page: page,
        minPrice: minPrice,
        maxPrice: maxPrice,
        subCategories: subCategoriesQuery()
      );

      emit(SearchSuccess());
    } catch (e) {
      print(e.toString() + "///////");
      emit(SearchFailure(e.toString()));
    }
  }


  bool? hasMoreProducts = false;

  Future<void> getMoreProduct() async {
    emit(SearchLoading());
    try {
      SearchModel? moreProducts =
      await searchRepo.getSearch(
          page: page++,
          minPrice: minPrice,
          maxPrice: maxPrice, searchWord: searchWord.text);
      searchModel!.data!.products
          .addAll(moreProducts!.data!.products);
      hasMoreProducts = moreProducts.data!.products.isNotEmpty;
      print("hasMoreProducts");
      print(hasMoreProducts);
      emit(SearchSuccess());
    } catch (e) {
      print(e.toString() + "///////");
      emit(SearchFailure(e.toString()));
    }
  }

}
