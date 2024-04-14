import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/login_model.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
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
  // Future<void> getUserDetails() async {
  //   emit(UserDetailsLoading());
  //   try {
  //     userDetails  = await homePageRepo.getUserDetails();
  //     if (userDetails!.isNotNull) {
  //       emit(UserDetailsSuccess());
  //     } else {
  //       emit(UserDetailsFailure('No details found'));
  //     }
  //   } catch (e) {
  //     emit(UserDetailsFailure(e.toString()));
  //   }
  // }
}
