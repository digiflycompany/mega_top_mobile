import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/global_repo.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_products_state.dart';


class LatestProductsCubit extends Cubit<LatestProductsState> {
  final GlobalRepo globalRepo;
  LatestProductsCubit(this.globalRepo) : super(LatestProductsInitial());
  int _currentImageIndex = 0;
  final List<String>? placeHolderImages=[
    AppAssets.megaTop2Logo,
  ];
  int get currentImageIndex => _currentImageIndex;

  void setImageIndex(int index) {
    _currentImageIndex = index;
  }

  Future<void> getLatestProducts() async {
    emit(LatestProductsLoading());
    try {
      final user = await globalRepo.getLatestProducts();
      if (user != null && user.success == true) {
        emit(LatestProductsSuccess(user));
      } else {
        emit(LatestProductsFailure(user?.message ?? ''));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(LatestProductsNoInternetConnection());
      } else {
        emit(LatestProductsFailure(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}
