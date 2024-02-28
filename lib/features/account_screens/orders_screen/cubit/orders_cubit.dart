import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/cubit/orders_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/cancel_bottom_sheet.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  int selected = 0;
  String _selectedValue = AppStrings.iChangedMyMind;
  String get selectedValue => _selectedValue;



  void selectOption(String newValue) {
    _selectedValue = newValue;
    emit(OrdersUpdated());
  }

  /// Method For Showing Cancel Bottom Sheet
  void showCancelBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      builder: (_) {
        return const CancelBottomSheet();
      },
    );
  }

  void selectOrderCondition(int index) {
    selected = index;
    emit(OrderConditionSelected(selected));
  }
}
