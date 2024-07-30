import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/data/models/notification_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class NotificationsRepo {
  Future<NotificationModel?> getUserNotification();
}

class NotificationsRepoImp implements NotificationsRepo {

  @override
  Future<NotificationModel?> getUserNotification() async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.accountDetailsAPI,
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return NotificationModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during getting user details: $e');
      throw e;
    }
    return null;
  }

}
