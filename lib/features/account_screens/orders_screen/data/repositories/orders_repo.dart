import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/data/models/orders_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class OrdersRepo {
  Future<OrdersModel?> getOrders({required int page, required int limit});
}

class OrdersRepoImp implements OrdersRepo {
  @override
  Future<OrdersModel?> getOrders({required int page, required int limit}) async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.myOrdersAPI(page, limit),
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return OrdersModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during getting user orders: $e');
      throw e;
    }
    return null;
  }
}


