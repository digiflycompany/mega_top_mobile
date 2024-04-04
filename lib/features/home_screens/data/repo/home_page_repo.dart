import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_details_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

abstract class HomePageRepo {

  Future<UserDetailsModel?> getUserDetails();
}

class HomePageRepoImp implements HomePageRepo {
  @override
  Future<UserDetailsModel?> getUserDetails()async {
    UserDetailsModel? userDetailsModel;
    await DioHelper.getData(
        url: EndPoints.userDetailsAPI,
        queryParameters: {
          "token": PreferencesHelper.getToken()
        }).then((value) {
      userDetailsModel = UserDetailsModel.fromJson(value?.data);
    }).catchError((onError) {
      print(onError.toString() + "??????");
    });
    return userDetailsModel;
  }

}
