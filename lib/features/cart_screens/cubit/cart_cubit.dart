import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int itemCount = 0;

  static CartCubit getCubit(context) => BlocProvider.of<CartCubit>(context);

  void increment() {
    itemCount++;
    emit(CartItemCountChanged(itemCount));
  }

  void decrement() {
    if (itemCount > 0) {
      itemCount--;
      emit(CartItemCountChanged(itemCount));
    }
  }


}
