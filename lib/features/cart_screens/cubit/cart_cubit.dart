import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int itemCount = 1;
  int selectedCardIndex = 0;
  static CartCubit getCubit(context) => BlocProvider.of<CartCubit>(context);

  void selectCard(int index) {
    selectedCardIndex = index;
    emit(CartCardSelected(selectedCardIndex));
  }

  void increment() {
    itemCount++;
    emit(CartItemCountChanged(itemCount));
  }

  void decrement() {
    if (itemCount > 1) {
      itemCount--;
      emit(CartItemCountChanged(itemCount));
    }
  }


}
