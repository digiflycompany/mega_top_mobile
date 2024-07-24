import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  final AccountDetailsRepo accountDetailsRepo;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AccountDetailsCubit(this.accountDetailsRepo) : super(AccountDetailsInitial());

  static AccountDetailsCubit getCubit(context) => BlocProvider.of(context);

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

  void savedSuccessToast(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayIconToast(
          toastIcon: AppAssets.checkIcon,
          message: AppStrings.savedSuccessfully,
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
        emit(AccountDetailsSuccess(user));
      } else {
        emit(AccountDetailsFailure(
            user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AccountDetailsNoInternetConnection());
      } else {
        emit(AccountDetailsFailure(e.toString()));
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
        emit(UpdatingAccountDetailsSuccess(user));
      } else {
        emit(UpdatingAccountDetailsFailure(
            user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(AccountDetailsNoInternetConnection());
      } else {
        emit(UpdatingAccountDetailsFailure(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }

}
