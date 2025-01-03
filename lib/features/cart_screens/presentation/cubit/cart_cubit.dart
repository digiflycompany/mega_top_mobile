import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/added_to_cart_bottom_sheet.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/order_confirmation_screen.dart';
import 'cart_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

  List<Map<String, dynamic>> cartProducts = PreferencesHelper.getCart();

  void addProductToCart(String id,String? name,String? price,String? image) {
    final existingProductIndex = cartProducts.indexWhere(
          (product) => product['_id'] == id,
    );

    if (existingProductIndex != -1) {
      cartProducts[existingProductIndex]['quantity'] += 1;
    } else
      cartProducts.add({
        '_id': id,
        'quantity': 1,
        'name': name,
        'price': price,
        'image': image,
      });

    PreferencesHelper.saveCart(cartProducts);
    emit(CartUpdated());
  }

  Future<void> checkout(String addressId,String name,String phoneNumber,String email) async{
    emit(CheckoutLoading());
    try {
      final user = await cartRepo.checkOutRepo(addressId,name,phoneNumber,email);
      if (user != null && user.success == true) {
        emit(CheckoutSuccess(user));
      } else {
        emit(CheckoutFailure(user?.message ?? ''));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(CartNoInternetConnection());
      } else {
        emit(CheckoutFailure(e.toString()));
      }
    }
  }

  void removeProductFromCart(String id) {
    cartProducts.removeWhere((product) => product['_id'] == id);
    PreferencesHelper.saveCart(cartProducts);
    emit(CartUpdated());
  }

  Future<void> sendCartToApi(List<Map<String, dynamic>> cartProducts) async {
    emit(CartSentToAPILoading());
    try {
      final user = await cartRepo.addProductsToCart(cartProducts);
      if (user != null && user.success == true) {
        emit(CartSentToAPISuccess(user));
      } else {
        emit(CartSentToAPIFailure(user?.message ?? ''));
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
      final cartProducts = PreferencesHelper.getCart();
      emit(GetUserCartSuccess(cartProducts: cartProducts));
    } catch (e) {
      emit(GetUserCartFailure(e.toString()));
    }
  }

  Future<void> increaseQuantity(String productId) async {
    await PreferencesHelper.increaseQuantity(productId);
    refreshCart();
  }

  Future<void> decreaseQuantity(String productId) async {
    await PreferencesHelper.decreaseQuantity(productId);
    refreshCart();
  }

  Future<void> removeProduct(String productId) async {
    await PreferencesHelper.removeProduct(productId);
    refreshCart();
  }

  void refreshCart() {
    final updatedCart = PreferencesHelper.getCart();
    emit(GetUserCartSuccess(cartProducts: updatedCart));
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

  void handleCartToAPIStates(BuildContext context, CartState state) {
    if (state is CartSentToAPISuccess) {
      Routes.paymentMethodsPageRoute.moveTo;
    }
    else if (state is CartSentToAPIFailure) {
      showErrorToast(context, AppLocalizations.of(context)!.addToCartFailed, state.error);
    }
    else if (state is CartNoInternetConnection) {
      showErrorToast(context, AppLocalizations.of(context)!.addToCartFailed, AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
  }

  void handleCheckoutStates(BuildContext context, CartState state) {
    if (state is CheckoutSuccess) {
      int count = 0;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => OrderConfirmationScreen(
            totalPrice: state.user.data!.totalPrice.toString(),
            orderId: state.user.data!.id,
            products: state.user.data!.products,
            dropOffAddress: state.user.data!.dropOffAddress,
            completed: state.user.data!.completed,
          ),
        ),
            (Route<dynamic> route) {
          return count++ == 4;
        },
      ).then((_) {
        PreferencesHelper.clearCart();
        PreferencesHelper.clearSelectedAddress();
        cartProducts.clear();
      });
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => OrderConfirmationScreen(
      //       orderId: state.user.data!.id,
      //       products: state.user.data!.products,
      //       dropOffAddress: state.user.data!.dropOffAddress,
      //       completed: state.user.data!.completed,
      //     ),
      //   ),
      // );
    } else if (state is CheckoutFailure) {
      showErrorToast(context, AppLocalizations.of(context)!.orderSummary, state.error);
    } else if (state is CartNoInternetConnection) {
      showErrorToast(context, AppLocalizations.of(context)!.checkoutFailed, AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
  }

}
