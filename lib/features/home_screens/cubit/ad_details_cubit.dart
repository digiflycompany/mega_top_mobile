import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/ad_details_state.dart';
import 'package:mega_top_mobile/features/home_screens/data/repo/home_page_repo.dart';

class AdDetailsCubit extends Cubit<AdDetailsState> {
  static AdDetailsCubit get(context) => BlocProvider.of(context);
  AdDetailsCubit(this.homeRepo) : super(AdDetailsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchAdDetails(String id) async {
    emit(AdLoadingState());
    var result = await homeRepo.fetchAdDetails(id);
    result.fold((failure) {
      failure.fold((connection) => emit(NoInternetState()),
          (error) => emit(AdErrorState(error.errMessage)));
    }, (ad) {
      emit(AdSuccessState(ad));
    });
  }
}
