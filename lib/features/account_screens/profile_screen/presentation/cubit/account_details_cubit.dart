import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/user_details_model.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_screen_widgets/remove_account_bottom_sheet.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  final AccountDetailsRepo accountDetailsRepo;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();
  int _wishListCount = 0;
  int _unreadNotificationCount = 0;
  int get wishListCount => _wishListCount;
  set wishListCount(int value) => _wishListCount = value;
  int get unreadNotificationCount => _unreadNotificationCount;
  set unreadNotificationCount(int value) => _unreadNotificationCount = value;

  AccountDetailsCubit(this.accountDetailsRepo) : super(AccountDetailsInitial());

  static AccountDetailsCubit getCubit(context) => BlocProvider.of(context);
  String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$';
  final emailRegex =
  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  final List<String>? placeHolderImages=[
    AppAssets.megaTop2Logo,
  ];

  bool isPasswordVisible = true;

  List<WishlistItem> _wishList = [];

  bool isProductInWishlist(String productId) {
    return _wishList.any((item) => item.id == productId);
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AccountDetailsInitial());
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

  void savedSuccessToast(BuildContext context,String message) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayIconToast(
          toastIcon: AppAssets.checkIcon,
          message: message,
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

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(overlayEntry!);
    });
  }

  Future<void> getAccountDetails() async {
    emit(AccountDetailsLoading());
    try {
      final user = await accountDetailsRepo.getUserDetails();
      if (user != null && user.success == true) {
        fullNameController.text = user.data.user.fullName;
        emailController.text = user.data.user.email;
        phoneController.text = user.data.user.phoneNumber;
        wishListCount = user.data.wishlistCount;
        PreferencesHelper.saveWishlist(user.data.user.wishlist);
        await PreferencesHelper.saveEmail(user.data.user.email);
        await PreferencesHelper.saveName(user.data.user.fullName);
        unreadNotificationCount = user.data.unreadNotificationsCount['ad'] ?? 0;
        await PreferencesHelper.saveWishListCount(wishListCount);
        emit(AccountDetailsSuccess(user));
      } else {
        emit(AccountDetailsFailure(user?.message ?? ""));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AccountDetailsNoInternetConnection());
      } else {
        emit(AccountDetailsFailure(e.toString()));
        print(e.toString()); // Log the error message
      }
    }
  }


  Future<void> updateAccountDetails(String email ,String fullName ,String phone) async {
    emit(UpdatingAccountDetailsLoading());
    try {
      final user = await accountDetailsRepo.updateUserDetails(email, fullName, phone);
      if (user != null && user.success == true) {
        fullNameController.text = user.data.user.fullName;
        emailController.text = user.data.user.email;
        phoneController.text = user.data.user.phoneNumber;
        await PreferencesHelper.saveEmail(user.data.user.email);
        await PreferencesHelper.saveName(user.data.user.fullName);
        emit(UpdatingAccountDetailsSuccess(user));
      } else {
        emit(UpdatingAccountDetailsFailure(
            user?.message ?? ""));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AccountDetailsNoInternetConnection());
      } else {
        emit(UpdatingAccountDetailsFailure(e.toString()));
      }
    }
  }

  Future<void> updatePassword(String password,BuildContext context) async {
    emit(UpdatingPasswordLoading());
    try {
      final user = await accountDetailsRepo.updatePassword(password);
      if (user != null && user.success == true) {
        emit(UpdatingPasswordSuccess(user));
        savedSuccessToast(context,AppLocalizations.of(context)!.savedSuccessfully);
      } else {
        emit(UpdatingPasswordFailure(user?.message??''));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AccountDetailsNoInternetConnection());
      } else {
        emit(UpdatingPasswordFailure(e.toString()));
      }
    }
  }

  void showRemoveAccountBottomSheet(BuildContext context) {
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
        return const RemoveAccountBottomSheet();
      },
    );
  }

  Future<void> removeAccount() async {
    emit(RemoveAccountLoading());
    try {
      final user = await accountDetailsRepo.removeAccount();
      if (user != null && user.success == true) {
        emit(RemoveAccountSuccess(user));
      } else {
        emit(RemoveAccountFailure(
            user?.message ?? ''));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AccountDetailsNoInternetConnection());
      } else {
        emit(RemoveAccountFailure(e.toString()));
      }
    }
  }

  Future<void> removeProductFormWishList(String productId) async {
    emit(RemoveFromWishListLoading());
    try {
      final user = await accountDetailsRepo.removeProductFromWishList(productId);
      if (user != null && user.success == true) {
        emit(RemoveFromWishListSuccess(user));
      } else {
        emit(RemoveFromWishListFailure(
            user?.message ?? ''));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AccountDetailsNoInternetConnection());
      } else {
        emit(RemoveFromWishListFailure(e.toString()));
      }
    }
  }

  void handleRemoveAccountStates(BuildContext context, AccountDetailsState state) {
    if(state is RemoveAccountSuccess){
      PreferencesHelper.logOut();
      Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
    }
    if(state is RemoveAccountFailure){
      showErrorToast(context, AppLocalizations.of(context)!.removingAccountFailed,state.error);
    }
    if(state is AccountDetailsNoInternetConnection){
      showErrorToast(context, AppLocalizations.of(context)!.removingAccountFailed,AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
  }

  void handleEditPasswordStates(BuildContext context, AccountDetailsState state) {
    if(state is UpdatingPasswordFailure){
      showErrorToast(context, AppLocalizations.of(context)!.updatingPasswordFailed,state.error);
    }
    if(state is AccountDetailsNoInternetConnection){
      showErrorToast(context, AppLocalizations.of(context)!.updatingPasswordFailed,AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
  }

  void handleRemovingFromWishList(BuildContext context, AccountDetailsState state) {
    if(state is RemoveFromWishListSuccess){
      savedSuccessToast(context, AppLocalizations.of(context)!.productRemovedSuccessfully);
      getAccountDetails();
    }
    if(state is RemoveFromWishListFailure){
      showErrorToast(context, AppLocalizations.of(context)!.removingProductFailed,state.error);
    }
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    return super.close();
  }

}
