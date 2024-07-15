import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/latest_offer_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/latest_product_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/repo/home_page_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeCubit getCubit(context) => BlocProvider.of(context);

  bool isGrid = true;

  bool noResult = false;

  HomePageRepo homePageRepo = new HomePageRepoImp();

  void setImageIndex(int index) {
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
  Future<LatestOfferModel?> getLastOffers() async {
    emit(LatestOfferLoading());
    try {
      latestOfferModel = await HomePageRepoImp().getLastOffers();
      if (latestOfferModel!.latestOfferList.isNotEmpty) {
        emit(LatestOfferSuccess());
      } else {
        emit(LatestOfferFailure('no latest offer found'));
      }
    } catch (e) {
      emit(LatestOfferFailure(e.toString()));
    }
    return null;
  }
  Future<void> getLatestProducts() async {
    emit(LatestProductLoading());
    try {
      List<LatestProductsModel>? fetchedLatestProducts = await homePageRepo.getLatestProduct();
      if (fetchedLatestProducts != null) {
        if (fetchedLatestProducts.isNotEmpty) {
          latestProducts = fetchedLatestProducts;
          print('Successfully fetched products');
          emit(LatestProductSuccess());
        } else {
          print('No products found');
          emit(LatestProductFailure('No products found'));
        }
      } else {
        print('Failed to fetch products or received null');
        emit(LatestProductFailure('Error fetching products'));
      }
    } catch (e) {
      print('Error in getLatestProducts: $e');
      emit(LatestProductFailure(e.toString()));
    }
  }

}
