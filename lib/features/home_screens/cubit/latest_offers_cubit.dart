import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/global_repo.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/latest_offers_state.dart';


class LatestOffersCubit extends Cubit<LatestOffersState> {
  final GlobalRepo globalRepo;
  LatestOffersCubit(this.globalRepo) : super(LatestOffersInitial());


  int _currentImageIndex = 0;

  int get currentImageIndex => _currentImageIndex;

  void setImageIndex(int index) {
    _currentImageIndex = index;
  }

  Future<void> getLatestOffers() async {
    emit(LatestOffersLoading());
    try {
      final user = await globalRepo.getLatestOffersProducts();
      if (user != null && user.success == true) {
        emit(LatestOffersSuccess(user));
      } else {
        emit(LatestOffersFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(LatestOffersNoInternetConnection());
      } else {
        emit(LatestOffersFailure(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}
