
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/updated_user_details_model.dart';
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

class UpdatingAccountDetailsLoading extends AccountDetailsState {}

class UpdatingAccountDetailsSuccess extends AccountDetailsState {
  final UpdatedUserDetailsModel user;

  UpdatingAccountDetailsSuccess(this.user);
}

class UpdatingAccountDetailsFailure extends AccountDetailsState {
  final String error;

  UpdatingAccountDetailsFailure(this.error);
}

class AccountDetailsNoInternetConnection extends AccountDetailsState {}