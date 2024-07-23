
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/user_details_model.dart';

abstract class AccountDetailsState {}

class AccountDetailsInitial extends AccountDetailsState {}

class AccountDetailsLoading extends AccountDetailsState {}

class AccountDetailsSuccess extends AccountDetailsState {
  final UserDetailsModel user;

  AccountDetailsSuccess(this.user);
}

class AccountDetailsFailure extends AccountDetailsState {
  final String error;

  AccountDetailsFailure(this.error);
}

class AccountDetailsNoInternetConnection extends AccountDetailsState {}