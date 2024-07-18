import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/email_verification_cubit/email_verification_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repo/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/success_pop_up.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final AuthRepo authRepo;
  EmailVerificationCubit(this.authRepo) : super(EmailVerificationInitial()) {
    initializeControllers();
  }

  static EmailVerificationCubit getCubit(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$';
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

  Future<void> emailVerification(String verificationOtp) async {
    emit(EmailVerifiedLoading());
    try {
      final user = await authRepo.verifyEmail(verificationOtp);
      if (user != null && user.success == true) {
        emit(EmailVerifiedSuccess(user));
      } else {
        emit(EmailVerifiedFailure(
            user?.message ?? AppStrings.incorrectCodeOrNetworkIssuesEn));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(NoInternetConnection());
      } else {
        emit(EmailVerifiedFailure(e.toString()));
      }
    }
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
        emit(NoInternetConnection());
      } else {
        emit(ResetPasswordFailure(e.toString()));
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
        emit(NoInternetConnection());
      } else {
        emit(VerifyResetPasswordFailure(e.toString()));
      }
    }
  }

  Future<void> updatePassword(
      String otp, String email, String password, String confirmPassword) async {
    emit(UpdatePasswordLoading());
    try {
      final user =
      await authRepo.updatePassword(otp, email, password, confirmPassword);
      if (user != null) {
        emit(UpdatePasswordSuccess(user));
      } else {
        emit(UpdatePasswordFailure('Invalid credentials'));
      }
    } catch (e) {
      if (e is DioException && e.error == 'No internet connection') {
        emit(NoInternetConnection());
      } else {
        emit(UpdatePasswordFailure(e.toString()));
      }
    }
  }

  Future<void> deleteAccount(String email, int id) async {
    emit(DeleteAccountLoading());
    try {
      final user = await authRepo.delete(email, id);
      if (user != null) {
        emit(DeleteAccountSuccess());
      } else {
        emit(DeleteAccountFailure('Invalid credentials or network issues.'));
      }
    } catch (e) {
      if (e is DioException && e.error == 'No internet connection') {
        emit(NoInternetConnection());
      } else {
        emit(DeleteAccountFailure(e.toString()));
      }
    }
  }

  Future<void> resendEmailCode() async {
    emit(EmailResendCodeLoading());
    try {
      final user = await authRepo.resendEmailCode();
      if (user != null && user.success == true) {
        emit(EmailResendCodeSuccess(user));
      } else {
        emit(EmailResendCodeFailure(
            user?.message ?? AppStrings.incorrectCodeOrNetworkIssuesEn));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(NoInternetConnection());
      } else {
        emit(EmailResendCodeFailure(e.toString()));
      }
    }
  }

  void handleSignUpEmailVerificationState(BuildContext context, AuthenticationState state) {
    if (state is EmailVerifiedSuccess) {
      Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
    } else if (state is EmailVerifiedFailure) {
      showErrorToast(context, AppStrings.emailVerificationFailed, state.error);
    } else if (state is EmailResendCodeFailure) {
      showErrorToast(context, AppStrings.sendingCodeFailed, state.error);
    } else if (state is EmailResendCodeSuccess) {
      codeSentToast(context);
    } else if (state is NoInternetConnection) {
      showErrorToast(
          context, AppStrings.emailVerificationFailed, AppStrings.noInternetConnectionPlease);
    }
  }
}
