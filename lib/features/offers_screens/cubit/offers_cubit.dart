import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/added_to_cart_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_repo.dart';
import 'package:mega_top_mobile/features/categories_screens/data/subcategories_model.dart';

import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
import 'package:mega_top_mobile/features/offers_screens/data/offer_model.dart';
import 'package:mega_top_mobile/features/offers_screens/data/offers_repo.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/filter_bottom_sheet.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/sort_bottom_sheet.dart';
import '../../../core/utils/app_assets.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());

  OffersCubit getCubit(context) => BlocProvider.of(context);

  bool isGrid = true;
  bool noResult = false;
  bool addedToFavourites = false;
  bool addedToCompare = false;
  String _selectedValue = AppStrings.defaultEn;
  String get selectedValue => _selectedValue;
  List< bool> checkboxStates = [];

  OffersRepo offersRepo = new OfferRepoImp();


  final List<String> images = [
    AppAssets.productBigPhoto,
    AppAssets.productBigPhotoRight,
    AppAssets.productBigPhoto,
  ];
  int _currentImageIndex = 0;
  int get currentImageIndex => _currentImageIndex;

  void selectOption(String newValue) {
    _selectedValue = newValue;
    emit(OffersUpdated());
  }

  void toggleList() {
    isGrid = !isGrid;
    emit(OffersInitial());
  }

  void toggleFavourite() {
    addedToFavourites = !addedToFavourites;
    emit(OffersInitial());
  }

  void toggleCompare() {
    addedToCompare = !addedToCompare;
    emit(OffersInitial());
  }

  void initializeCheckboxes(int subCategoriesLength) {
    checkboxStates= List.filled(subCategoriesLength, false);
    emit(OffersUpdated());
  }

  void setImageIndex(int index) {
    _currentImageIndex = index;
    emit(OffersProductUpdated());
  }

  void toggleCheckbox(int index) {
    checkboxStates[index] = !checkboxStates[index];
    emit(OffersUpdated());
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

  int selectedProductIndex = 0;

  void setCategoryProductIndex({required int selectedProductIndex}) {
    this.selectedProductIndex = selectedProductIndex;
  }

  void sortingFromHighPrice() {
    offerModel!.data!.products
        .sort((a, b) => b.price!.finalPrice!.compareTo(a.price!.finalPrice!));
  }

  void sortingFromLowPrice() {
    offerModel!.data!.products
        .sort((a, b) => a.price!.finalPrice!.compareTo(b.price!.finalPrice!));
  }

  int getDiscountPercentage(
      {required int finalPrice, required int originPrice}) {
    return 1 - finalPrice ~/ originPrice;
  }

  SubCategoriesModel? subCategoriesModel;

  Future<void> getSubCategories(String categoriesId) async {
    emit(SubCategoryLoading());
    try {
      subCategoriesModel = null;
      subCategoriesModel = await offersRepo.getSubCategories(
          categoryId: categoriesId);
      emit(SubCategorySuccess());
    } catch (e) {
      print(e.toString() + "///////");
      emit(SubCategoryFailure(e.toString()));
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
        return SortBottomSheet(
          onTapDefault: () {
            page = 1;
            getOffers();
          },
          onTapFromHighPrice: (){
            sortingFromHighPrice();
          },
          onTapFromLowPrice:(){
            sortingFromLowPrice();
          } ,
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
        return  FractionallySizedBox(
          heightFactor: 1.0, // For full screen height
          child: FilterBottomSheet(
            cubit: getCubit(context),
            getProductsFunction: getOffers,
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


  OfferModel ? offerModel;

  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  int page = 1;
  int? minPrice;
  int? maxPrice;

  Future<void> getOffers() async{
    emit(OffersLoading());
    try {
      offerModel = null;
      offerModel =
      await offersRepo.getOffers(page: page,minPrice: minPrice,
          maxPrice: maxPrice);
      emit(OffersSuccess());
    } catch (e) {
      print(e.toString() + "///////");
      emit(OffersFailure(e.toString()));
    }
  }

  bool ? hasMoreProducts = false;

  Future<void> getMoreProduct() async {
    emit(OffersLoading());
    try {
      OfferModel? moreProducts = await offersRepo.
      getOffers(page: page++,minPrice: minPrice,maxPrice: maxPrice);
      offerModel!.data!.products.addAll(moreProducts!.data!.products);
      print("ooooooooooooooooooooof");
      hasMoreProducts = moreProducts.data!.products.isNotEmpty;
      emit(OffersSuccess());
    } catch (e) {
      emit(OffersFailure(e.toString()));
    }
  }


}

