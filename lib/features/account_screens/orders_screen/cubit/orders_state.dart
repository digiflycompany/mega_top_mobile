abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersUpdated extends OrdersState {}

class OrderConditionSelected extends OrdersState {
  final int? selectedOrderCondition;

  OrderConditionSelected(this.selectedOrderCondition);
}