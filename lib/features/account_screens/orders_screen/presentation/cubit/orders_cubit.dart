import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/data/models/orders_model.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/data/repositories/orders_repo.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/cubit/orders_state.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/cancel_bottom_sheet.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());

  int selected = 0;
  String _selectedValue = AppStrings.iChangedMyMind;
  String get selectedValue => _selectedValue;

  List<OrderData> orders = [];
  int currentPage = 1;
  final int limit = 10; // Number of orders to load per page
  bool hasMoreOrders = true; // To track if more pages are available

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
  void showErrorToast(BuildContext context, String title, String text) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: CustomErrorToast(
          title: title,
          message: text,
          color: AppColors.redIconColor,
          onDismissed: () {
            if (overlayEntry != null) {
              overlayEntry!.remove();
              overlayEntry = null;
            }
          },
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
  }

  void selectOrderCondition(int index) {
    selected = index;
    emit(OrderConditionSelected(selected));
  }

  Future<void> getUserOrder(String orderId) async {
    emit(UserOrderLoading());
    try {
      final user = await ordersRepo.getOrder(orderId: orderId);
      if (user != null && user.success == true) {
        emit(UserOrderLoaded(user));
      } else {
        emit(UserOrderFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(OrdersNoInternetConnection());
      } else {
        emit(UserOrderFailure(e.toString()));
      }
    }
  }

  /// Method to load orders with pagination
  Future<void> loadOrders() async {
    if (!hasMoreOrders) return; // No more orders to load
    emit(OrdersLoading());
    try {
      final ordersModel = await ordersRepo.getOrders(page: currentPage, limit: limit);
      if (ordersModel != null && ordersModel.success == true) {
        if (ordersModel.data != null && ordersModel.data!.isNotEmpty) {
          orders.addAll(ordersModel.data!);
          currentPage++;
        } else {
          hasMoreOrders = false;
        }
        emit(OrdersLoaded(orders));
      } else {
        emit(OrdersFailure(ordersModel?.message ?? AppStrings.failedToLoadOrders));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(OrdersNoInternetConnection());
      } else {
        emit(OrdersFailure(e.toString()));
      }
    }
  }

  /// Method to refresh orders (e.g., on pull-to-refresh)
  Future<void> refreshOrders() async {
    currentPage = 1;
    hasMoreOrders = true;
    orders.clear();
    await loadOrders();
  }
}
