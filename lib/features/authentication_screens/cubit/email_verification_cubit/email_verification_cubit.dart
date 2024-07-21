import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_icon_toast.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/email_verification_cubit/email_verification_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repo/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final AuthRepo authRepo;
  EmailVerificationCubit(this.authRepo) : super(EmailVerificationInitial());

  static EmailVerificationCubit getCubit(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  String otp = '';

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

  Future<void> emailVerification(String verificationOtp) async {
    emit(EmailVerificationLoading());
    try {
      final user = await authRepo.verifyEmail(verificationOtp);
      if (user != null && user.success == true) {
        emit(EmailVerificationSuccess(user));
      } else {
        emit(EmailVerificationFailure(
            user?.message ?? AppStrings.incorrectCodeOrNetworkIssuesEn));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(EmailVerificationNoInternetConnection());
      } else {
        emit(EmailVerificationFailure(e.toString()));
      }
    }
  }

  Future<void> resendEmailCode() async {
    emit(EmailVerificationResendCodeLoading());
    try {
      final user = await authRepo.resendEmailCode();
      if (user != null && user.success == true) {
        emit(EmailVerificationResendCodeSuccess(user));
      } else {
        emit(EmailVerificationResendCodeFailure(
            user?.message ?? AppStrings.incorrectCodeOrNetworkIssuesEn));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(EmailVerificationNoInternetConnection());
      } else {
        emit(EmailVerificationResendCodeFailure(e.toString()));
      }
    }
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


  void handleSignUpEmailVerificationState(BuildContext context, EmailVerificationState state) {
    if (state is EmailVerificationSuccess) {
      Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
    } else if (state is EmailVerificationFailure) {
      showErrorToast(context, AppStrings.emailVerificationFailed, state.error);
    } else if (state is EmailVerificationResendCodeFailure) {
      showErrorToast(context, AppStrings.sendingCodeFailed, state.error);
    } else if (state is EmailVerificationResendCodeSuccess) {
      codeSentToast(context);
    } else if (state is EmailVerificationNoInternetConnection) {
      showErrorToast(
          context, AppStrings.emailVerificationFailed, AppStrings.noInternetConnectionPlease);
    }
  }
}
