import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/global_repo.dart';
import 'package:mega_top_mobile/core/utils/global_state.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_toast.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlobalCubit extends Cubit<GlobalState> {
  final GlobalRepo globalRepo;
  GlobalCubit(this.globalRepo) : super(GlobalInitial());
  bool addedToFavourites = false;
  bool addedToCompare = false;

  int _currentImageIndex = 0;

  int get currentImageIndex => _currentImageIndex;

  void setImageIndex(int index) {
    _currentImageIndex = index;
  }

  int getDiscountPercentage(
      {required int finalPrice, required int originPrice}) {
    return 1 - finalPrice ~/ originPrice;
  }
  /// Show Primary Toast
  void showPrimaryToast(BuildContext context,String text) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayToast(
          message: text,
          color: AppColors.primaryColor,
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

  /// Show Remove Item Dialog
  // void showRemoveItemDialog(BuildContext context) {
  //   if (Platform.isIOS) {
  //     showCupertinoDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const CupertinoAlertDialog(
  //           content: RemoveItemDialog(),
  //         );
  //       },
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const AlertDialog(
  //           backgroundColor: Colors.white,
  //           contentPadding: EdgeInsets.zero,
  //           content: RemoveItemDialog(),
  //         );
  //       },
  //     );
  //   }
  // }
  void toggleFavourite() {
    addedToFavourites = !addedToFavourites;
    // categoriesRepo.addToWishList("1987",
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL21lZ2F0b3AuY29tLmVnIiwiaWF0IjoxNzExMjk0NTc1LCJuYmYiOjE3MTEyOTQ1NzUsImV4cCI6MTcxMTg5OTM3NSwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMTQifX19.iy3gvBgYShSO4U16q1LTQ5Xo5cii2M5rxAEy3TLyiPY");
    emit(GlobalInitial());
  }

  Future<void> addToWishList(String productId) async {
    emit(AddToWishListLoading());
    try {
      final user = await globalRepo.addToWishList(productId);
      if (user != null && user.success == true) {
        emit(AddToWishListSuccess(user));
      } else {
        emit(AddToWishListFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(WishListNoInternetConnection());
      } else {
        emit(AddToWishListFailure(e.toString()));
      }
    }
  }

  Future<void> removeFromWishList(String productId) async {
    emit(RemoveFromWishListLoading());
    try {
      final user = await globalRepo.removeFromWishList(productId);
      if (user != null && user.success == true) {
        emit(RemoveFromWishListSuccess(user));
      } else {
        emit(RemoveFromWishListFailure(user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(WishListNoInternetConnection());
      } else {
        emit(RemoveFromWishListFailure(e.toString()));
      }
    }
  }

  // Future<void> getLatestOffers() async {
  //   emit(LatestOffersLoading());
  //   try {
  //     final user = await globalRepo.getLatestOffersProducts();
  //     if (user != null && user.success == true) {
  //       emit(LatestOffersSuccess(user));
  //     } else {
  //       emit(LatestOffersFailure(user?.message ?? AppStrings.invalidCred));
  //     }
  //   } catch (e) {
  //     if (e is DioException && e.error == AppStrings.noInternetConnection) {
  //       emit(ProductsNoInternetConnection());
  //     } else {
  //       emit(LatestOffersFailure(e.toString()));
  //     }
  //   }
  // }

  void showAddToFavouritesToast(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayIconToast(
          toastIcon: AppAssets.addToWishListIcon,
          message: AppLocalizations.of(context)!.theProductAddedToWishList,
          color: AppColors.primaryGreenColor,
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

  void showRemoveFromFavouritesToast(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayIconToast(
          toastIcon: AppAssets.removeFromWishListIcon,
          message: AppLocalizations.of(context)!.theProductRemovedFromWishList,
          color: AppColors.primaryRedColor,
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

  void handleWishListState(BuildContext context, GlobalState state) {
    if (state is AddToWishListSuccess) {
      context.read<AccountDetailsCubit>().getAccountDetails();
      showAddToFavouritesToast(context);
    }
    if (state is RemoveFromWishListSuccess) {
      context.read<AccountDetailsCubit>().getAccountDetails();
      showRemoveFromFavouritesToast(context);
    }
    if(state is AddToWishListFailure){
      showErrorToast(context, AppStrings.addToWishListFailed, state.error);
    }
    if(state is RemoveFromWishListFailure){
      showErrorToast(context, AppStrings.removeFromWishListFailed, state.error);
    }
    if(state is WishListNoInternetConnection){
      showErrorToast(context, AppLocalizations.of(context)!.noInternet, AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
  }

}
