import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/brands/cubit/brands_state.dart';
import 'package:mega_top_mobile/features/brands/data/models/brand_model.dart';
import 'package:mega_top_mobile/features/categories_screens/cubit/category_cubit.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_bottom_sheet.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsInitial());

  static BrandsCubit get(context) => BlocProvider.of(context);

  Brand selectedBrand = Brand(
      'https://cdn.salla.sa/RjAdq/DbkoORSCGfvSxmyuJjCUc3ad4yyLvtCrmzI2HUFO.png',
      'HikVision',
      '0');

  List<Brand> brands = [
    Brand(
        'https://cdn.salla.sa/RjAdq/DbkoORSCGfvSxmyuJjCUc3ad4yyLvtCrmzI2HUFO.png',
        'HikVision',
        '0'),
    Brand(
        'https://toshibaa01.wordpress.com/wp-content/uploads/2020/08/d8b6d8b6d8b6d8b6d8b6d8b6d8b6-21.png',
        'توشيبا',
        '1'),
    Brand(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy4ivXE5URmwg-NOsO2YpNFP6e_YHaokbxvQ&s',
        'Samsung',
        '2'),
    Brand(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIL-LyEgYD1hkpQe6A6PjmA31EacZCh7JzbA&s',
        'UnionAir',
        '3'),
    Brand(
        'https://toshibaa01.wordpress.com/wp-content/uploads/2020/08/d8b6d8b6d8b6d8b6d8b6d8b6d8b6-21.png',
        'توشيبا',
        '4'),
    Brand(
        'https://toshibaa01.wordpress.com/wp-content/uploads/2020/08/d8b6d8b6d8b6d8b6d8b6d8b6d8b6-21.png',
        'توشيبا',
        '5'),
    Brand(
        'https://toshibaa01.wordpress.com/wp-content/uploads/2020/08/d8b6d8b6d8b6d8b6d8b6d8b6d8b6-21.png',
        'توشيبا',
        '6')
  ];

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
}