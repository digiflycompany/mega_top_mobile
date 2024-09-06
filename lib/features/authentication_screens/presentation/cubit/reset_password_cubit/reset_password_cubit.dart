import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repositories/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/success_pop_up.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial()) {
    initializeControllers();
  }

  static ResetPasswordCubit getCubit(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  String? validatePassword(String value, BuildContext context) {
    if (value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterYourPassword;
    }

    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return AppLocalizations.of(context)!.passwordFirstValidation;
    }

    if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
      return AppLocalizations.of(context)!.passwordSecondValidation;
    }

    if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
      return AppLocalizations.of(context)!.passwordThirdValidation;
    }

    if (!RegExp(r'^(?=.*[@$!%*?&])').hasMatch(value)) {
      return AppLocalizations.of(context)!.passwordFourthValidation;
    }

    if (value.length < 7) {
      return AppLocalizations.of(context)!.passwordFifthValidation;
    }

    return null;
  }

  final emailRegex =
  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  TextEditingController resetPasswordEmailController = TextEditingController();
  TextEditingController createNewPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  bool isPasswordVisible = true;
  bool newPasswordSuccess = false;
  String otp = '';

  void initializeControllers() {
    resetPasswordEmailController = TextEditingController();
    createNewPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  void disposeControllers() {
    resetPasswordEmailController.dispose();
    createNewPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ResetPasswordInitial());
  }

  void passwordSuccess() {
    newPasswordSuccess = true;
    emit(ResetPasswordInitial());
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

  void codeSentToast(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayIconToast(
          toastIcon: AppAssets.checkIcon,
          message: AppStrings.codeSentSuccessfully,
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

  void passwordChangedSuccessfully(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const NewPasswordPopUp();
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Routes.loginRoute.moveToCurrentRouteAndRemoveAll;
    });
  }

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      final user = await authRepo.resetPassword(email);
      if (user != null && user.success == true) {
        emit(ResetPasswordSuccess(user));
      } else {
        emit(ResetPasswordFailure(user?.message??AppStrings.incorrectEmailOrNetworkIssuesEn));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(ResetPasswordNoInternetConnection());
      } else {
        emit(ResetPasswordFailure(e.toString()));
      }
    }
  }

  Future<void> resendResetPassword(String email) async {
    emit(ResendResetPasswordCodeLoading());
    try {
      final user = await authRepo.resetPassword(email);
      if (user != null && user.success == true) {
        emit(ResendResetPasswordCodeSuccess(user));
      } else {
        emit(ResendResetPasswordCodeFailure(user?.message??AppStrings.incorrectEmailOrNetworkIssuesEn));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(ResetPasswordNoInternetConnection());
      } else {
        emit(ResendResetPasswordCodeFailure(e.toString()));
      }
    }
  }


  Future<void> verifyResetPassword(String email,String resetPasswordCode) async {
    emit(VerifyResetPasswordLoading());
    try {
      final user = await authRepo.verifyResetPassword(email,resetPasswordCode);
      if (user != null && user.success == true) {
        await PreferencesHelper.saveToken(token: user.token!);
        print(await PreferencesHelper.getToken());
        emit(VerifyResetPasswordSuccess(user));
      } else {
        emit(VerifyResetPasswordFailure(user?.message??AppStrings.incorrectEmailOrNetworkIssuesEn));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(ResetPasswordNoInternetConnection());
      } else {
        emit(VerifyResetPasswordFailure(e.toString()));
      }
    }
  }

  Future<void> updatePassword(String password) async {
    emit(UpdatePasswordLoading());
    try {
      final user = await authRepo.updatePassword(password);
      if (user != null && user.success == true) {
        emit(UpdatePasswordSuccess(user));
      } else {
        emit(UpdatePasswordFailure(user?.message??AppStrings.incorrectEmailOrNetworkIssuesEn));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(ResetPasswordNoInternetConnection());
      } else {
        emit(UpdatePasswordFailure(e.toString()));
      }
    }
  }

  void handleCreatingNewPasswordStates(BuildContext context, ResetPasswordState state) {
    if(state is UpdatePasswordSuccess){
      passwordChangedSuccessfully(context);
    }
    if(state is UpdatePasswordFailure){
      showErrorToast(context, AppLocalizations.of(context)!.creatingNewPasswordFailed,state.error);
    }
    if(state is ResetPasswordNoInternetConnection){
      showErrorToast(
          context, AppLocalizations.of(context)!.creatingNewPasswordFailed,AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
  }

  void handleVerifyingEmailStates(BuildContext context, ResetPasswordState state) {
    if(state is VerifyResetPasswordSuccess){
      Routes.createNewPasswordRoute.moveTo;
    }
    if(state is VerifyResetPasswordFailure){
      showErrorToast(
          context, AppLocalizations.of(context)!.emailVerificationFailed, state.error);
    }
    if(state is ResetPasswordNoInternetConnection){
      showErrorToast(
          context, AppLocalizations.of(context)!.emailVerificationFailed, AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
    if(state is ResendResetPasswordCodeSuccess){
      codeSentToast(context);
    }
  }

  void handleResetPasswordStates(BuildContext context, ResetPasswordState state) {
    if(state is ResetPasswordSuccess){
      context.moveWithArguments(
        Routes.verifyEmailRoute,
        arguments: resetPasswordEmailController.text,
      );
    }
    if(state is ResetPasswordFailure){
      showErrorToast(context, AppLocalizations.of(context)!.resetPasswordFailed,state.error);
    }
    if(state is ResetPasswordNoInternetConnection){
      showErrorToast(context, AppLocalizations.of(context)!.resetPasswordFailed,AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
  }

}
