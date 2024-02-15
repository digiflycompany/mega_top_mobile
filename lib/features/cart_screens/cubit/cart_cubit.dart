import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_string.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int itemCount = 1;
  int selectedCardIndex = 0;
  int selectedPaymentCardIndex =0;
  String selectedValue = AppStrings.cashOnDeliveryEn;

  static CartCubit getCubit(context) => BlocProvider.of<CartCubit>(context);
  /// Card Function
  void selectCard(int index) {
    selectedCardIndex = index;
    emit(CartCardSelected(selectedCardIndex));
  }
  /// Payment Card Function
  void selectPaymentCard(int index) {
    selectedPaymentCardIndex = index;
    emit(PaymentCardSelected(selectedPaymentCardIndex));
  }
  /// Payment Card Radio Button Selection
  void selectOption(String newValue) {
    selectedValue = newValue;
    emit(CartUpdated());
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
