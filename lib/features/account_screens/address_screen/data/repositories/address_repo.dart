import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/user_addresses_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class AddressRepo {
  Future<UserAddressesModel?> getUserAddresses();
}

class AddressRepoImp implements AddressRepo {

  @override
  Future<UserAddressesModel?> getUserAddresses() async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.userAddressesAPI,
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return UserAddressesModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during getting user Addresses: $e');
      throw e;
    }
    return null;
  }

}
