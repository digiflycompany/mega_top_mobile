import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_ads_state.dart';
import 'package:mega_top_mobile/features/home_screens/data/repo/home_page_repo.dart';

class HomeAdsCubit extends Cubit<HomeAdsState> {
  HomeAdsCubit(this.homeRepo) : super(HomeAdsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchAds() async {
    emit(GetAdsLoadingState());
    var result = await homeRepo.fetchHomeAds();
    result.fold((failure) {
      emit(GetAdsErrorState(failure.errMessage));
    }, (adsResponse) {
      emit(GetAdsSuccessState(adsResponse.data?.advertisements ?? []));
    });
  }
}
