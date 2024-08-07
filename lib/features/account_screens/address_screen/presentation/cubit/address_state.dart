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

class AddressNoInternetConnection extends AddressState {}