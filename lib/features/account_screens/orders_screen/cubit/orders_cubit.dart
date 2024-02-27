import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  int selected = 0;

  void selectOrderCondition(int index) {
    selected = index;
    emit(OrderConditionSelected(selected));
  }
}
