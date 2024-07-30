import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';

abstract class WishListState {}

class WishListInitial extends WishListState {}

class WishListLoading extends WishListState {}

class WishListSuccess extends WishListState {
  final UserModel user;

  WishListSuccess(this.user);
}

class WishListFailure extends WishListState {
  final String error;

  WishListFailure(this.error);
}

class WishListNoInternetConnection extends WishListState {}