import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/added_to_cart_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_bottom_sheet.dart';
import 'package:mega_top_mobile/features/offers_screens/cubit/offers_state.dart';
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
  final Map<String, bool> checkboxStates = {};



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

  void initializeCheckboxes(List<String> items) {
    for (var item in items) {
      checkboxStates[item] = false;
    }
    emit(OffersUpdated());
  }

  void setImageIndex(int index) {
    _currentImageIndex = index;
    emit(OffersProductUpdated());
  }

  void toggleCheckbox(String item) {
    if (checkboxStates.containsKey(item)) {
      checkboxStates[item] = !checkboxStates[item]!;
      emit(OffersUpdated());
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
}

