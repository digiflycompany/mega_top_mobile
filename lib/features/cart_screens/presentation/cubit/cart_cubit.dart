import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/added_to_cart_bottom_sheet.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

  List<Map<String, dynamic>> cartProducts = PreferencesHelper.getCart();

  void addProductToCart(String? id) {
    final existingProductIndex = cartProducts.indexWhere(
          (product) => product['_id'] == id,
    );

    if (existingProductIndex != -1) {
      cartProducts[existingProductIndex]['quantity'] += 1;
    } else {
      cartProducts.add({
        '_id': id,
        'quantity': 1,
      });
    }
    PreferencesHelper.saveCart(cartProducts);
    emit(CartUpdated());
  }

  void removeProductFromCart(String id) {
    cartProducts.removeWhere((product) => product['_id'] == id);
    PreferencesHelper.saveCart(cartProducts);
    emit(CartUpdated());
  }

  void updateProductQuantity(String id, int quantity) {
    final existingProductIndex = cartProducts.indexWhere(
          (product) => product['_id'] == id,
    );

    if (existingProductIndex != -1) {
      cartProducts[existingProductIndex]['quantity'] = quantity;
      PreferencesHelper.saveCart(cartProducts);
      emit(CartUpdated());
    }
  }

  Future<void> sendCartToApi() async {
    emit(CartSentToAPILoading());
    try {
      final user = await cartRepo.addProductsToCart(cartProducts);
      if (user != null && user.success == true) {
        emit(CartSentToAPISuccess(user));
      } else {
        emit(CartSentToAPIFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(CartNoInternetConnection());
      } else {
        emit(CartSentToAPIFailure(e.toString()));
      }
    }
  }

  Future<void> getUserCart() async {
    emit(GetUserCartLoading());
    try {
      final user = await cartRepo.getUserCart();
      if (user != null && user.success == true) {
        cartProducts = user.data!.products.cast<Map<String, dynamic>>(); // Assume this is the correct format
        PreferencesHelper.saveCart(cartProducts);
        emit(GetUserCartSuccess(user));
      } else {
        emit(GetUserCartFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(CartNoInternetConnection());
      } else {
        emit(GetUserCartFailure(e.toString()));
      }
    }
  }

  void showAddedToCartBottomSheet(BuildContext context) {
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
        return const AddToCartBottomSheet();
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

  void handleAddToCartStates(BuildContext context, CartState state) {
    if (state is CartUpdated) {
      sendCartToApi();
    } else if (state is CartSentToAPISuccess) {
      showAddedToCartBottomSheet(context);
    } else if (state is CartSentToAPIFailure) {
      showErrorToast(context, AppStrings.addToCartFailed, state.error);
    } else if (state is CartNoInternetConnection) {
      showErrorToast(context, AppStrings.addToCartFailed, AppStrings.pleaseCheckYourInternet);
    }
  }
}
