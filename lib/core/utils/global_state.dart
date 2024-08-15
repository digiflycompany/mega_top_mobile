import 'package:mega_top_mobile/core/utils/theme/wish_list_model.dart';

abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GlobalUpdated extends GlobalState {}

class AddToWishListLoading extends GlobalState {}

class AddToWishListSuccess extends GlobalState {
  final WishListModel user;

  AddToWishListSuccess(this.user);
}

class AddToWishListFailure extends GlobalState {
  final String error;

  AddToWishListFailure(this.error);

}

class RemoveFromWishListLoading extends GlobalState {}

class RemoveFromWishListSuccess extends GlobalState {
  final WishListModel user;

  RemoveFromWishListSuccess(this.user);
}

class RemoveFromWishListFailure extends GlobalState {
  final String error;

  RemoveFromWishListFailure(this.error);

}

class WishListNoInternetConnection extends GlobalState {}

class ProductsNoInternetConnection extends GlobalState {}

class ProductUpdated extends GlobalState {}




