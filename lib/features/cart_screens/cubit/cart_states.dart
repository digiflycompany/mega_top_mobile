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

