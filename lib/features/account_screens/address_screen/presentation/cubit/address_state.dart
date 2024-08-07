import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/cities_model.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/user_address_model.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/user_addresses_model.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class UserAddressesLoading extends AddressState {}

class UserAddressesSuccess extends AddressState {
  final UserAddressesModel user;

  UserAddressesSuccess(this.user);
}

class UserAddressesFailure extends AddressState {
  final String error;

  UserAddressesFailure(this.error);
}

class AddNewAddressLoading extends AddressState {}

class AddNewAddressSuccess extends AddressState {
  final UserAddressModel user;

  AddNewAddressSuccess(this.user);
}

class AddNewAddressFailure extends AddressState {
  final String error;

  AddNewAddressFailure(this.error);
}

class CitiesLoading extends AddressState {}

class CitiesSuccess extends AddressState {
  final CitiesModel user;

  CitiesSuccess(this.user);
}

class CitiesFailure extends AddressState {
  final String error;

  CitiesFailure(this.error);
}

class AddressNoInternetConnection extends AddressState {}