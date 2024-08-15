import 'package:mega_top_mobile/features/account_screens/orders_screen/data/models/orders_model.dart';
import 'package:mega_top_mobile/features/cart_screens/data/models/checkout_model.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<OrderData> orders;

  OrdersLoaded(this.orders);
}

class OrdersFailure extends OrdersState {
  final String error;

  OrdersFailure(this.error);
}

class UserOrderLoading extends OrdersState {}

class UserOrderLoaded extends OrdersState {
  final CheckoutModel user;

  UserOrderLoaded(this.user);
}

class UserOrderFailure extends OrdersState {
  final String error;

  UserOrderFailure(this.error);
}


class OrdersUpdated extends OrdersState {}

class OrdersNoInternetConnection extends OrdersState {}

class OrderConditionSelected extends OrdersState {
  final int selectedIndex;

  OrderConditionSelected(this.selectedIndex);
}
