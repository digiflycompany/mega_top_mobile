import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/data/models/brands_response.dart';
import 'package:mega_top_mobile/features/brands/data/repos/brands_repo.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_bottom_sheet.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsInitial());
  static BrandsCubit get(context) => BlocProvider.of(context);
  BrandsRepo _repo = BrandsRepoImp();

  Brand selectedBrand = Brand();

  List<Brand> brands = [];

  selectBrand(Brand brand) {
    selectedBrand = brand;
  }

  bool isGrid = true;

  final List<String>? placeHolderImages = [
    AppAssets.megaTop2Logo,
  ];

  final List<String> images = [
    AppAssets.productBigPhoto,
    AppAssets.productBigPhotoRight,
    AppAssets.productBigPhoto
  ];
  int _currentImageIndex = 0;

  int get currentImageIndex => _currentImageIndex;

  void toggleList() {
    isGrid = !isGrid;
    emit(BrandsInitial());
  }

  int page = 1;
  int? minPrice;
  int? maxPrice;

  bool? hasMoreProducts = false;

  int selectedProductIndex = 0;

  String _selectedValue = AppStrings.defaultEn;
  String get selectedValue => _selectedValue;

  void showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0), topRight: Radius.circular(0))),
        builder: (_) {
          return SortBottomSheet(
              onTapDefault: () {
                page = 1;
                // getSelectedCategories(selectedCategoryId!);
              },
              onTapFromHighPrice: () {
                // sortingFromHighPrice();
              },
              onTapFromLowPrice: () {
                // sortingFromLowPrice();
              },
              cubit: CategoryCubit().getCubit(context));
        });
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0), topRight: Radius.circular(0))),
        builder: (BuildContext context) {
          return FractionallySizedBox(
              heightFactor: 1.0, // For full screen height
              child: FilterBottomSheet(
                  cubit: CategoryCubit().getCubit(context),
                  getProductsFunction: () {
                    // getSelectedCategories(selectedCategoryId!);
                  }));
        });
  }

  Future<void> getBrands() async {
    emit(BrandsLoadingState());
    try {
      BrandsResponse? fetchedBrands = await _repo.fetchBrands();
      if (fetchedBrands != null && fetchedBrands.success == true) {
        brands = fetchedBrands.data?.brands ?? [];
        emit(BrandsSuccessState(fetchedBrands.data?.brands ?? []));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(BrandsNoInternetConnection());
      } else {
        emit(BrandsFailureState(e.toString()));
      }
    }
  }
}