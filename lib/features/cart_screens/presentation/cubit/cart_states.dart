import 'package:mega_top_mobile/features/cart_screens/data/models/add_to_cart_model.dart';
import 'package:mega_top_mobile/features/cart_screens/data/models/user_cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {}

class CartItemCountChanged extends CartState {
  final int itemCount;

  CartItemCountChanged(this.itemCount);
}

class CartCardSelected extends CartState {
  final int? selectedCardIndex;

  CartCardSelected(this.selectedCardIndex);
}

class ProductAddedToCartSuccess extends CartState{}

class CartSentToAPISuccess extends CartState{
  final AddToCartModel user;

  CartSentToAPISuccess(this.user);
}

class CartSentToAPIFailure extends CartState{
  final String error;

  CartSentToAPIFailure(this.error);
}

class CartSentToAPILoading extends CartState{}

class GetUserCartSuccess extends CartState{
  final UserCartModel user;

  GetUserCartSuccess(this.user);
}

class GetUserCartFailure extends CartState{
  final String error;

  GetUserCartFailure(this.error);
}

class GetUserCartLoading extends CartState{}

class CartNoInternetConnection extends CartState{}

class PaymentCardSelected extends CartState {
  final int? selectedPaymentCardIndex;

  PaymentCardSelected(this.selectedPaymentCardIndex);
}
