import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/deactivated_user_model.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/updated_user_details_model.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/user_details_model.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/data/models/remove_from_wish_list_model.dart';

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

class UpdatingPasswordLoading extends AccountDetailsState {}

class UpdatingPasswordSuccess extends AccountDetailsState {
  final UpdatedUserDetailsModel user;

  UpdatingPasswordSuccess(this.user);
}

class UpdatingPasswordFailure extends AccountDetailsState {
  final String error;

  UpdatingPasswordFailure(this.error);
}

class RemoveAccountLoading extends AccountDetailsState {}

class RemoveAccountSuccess extends AccountDetailsState {
  final DeactivatedUserModel user;

  RemoveAccountSuccess(this.user);
}

class RemoveAccountFailure extends AccountDetailsState {
  final String error;

  RemoveAccountFailure(this.error);
}

class RemoveFromWishListLoading extends AccountDetailsState {}

class RemoveFromWishListSuccess extends AccountDetailsState {
  final RemoveFromWishListModel user;

  RemoveFromWishListSuccess(this.user);
}

class RemoveFromWishListFailure extends AccountDetailsState {
  final String error;

  RemoveFromWishListFailure(this.error);
}

