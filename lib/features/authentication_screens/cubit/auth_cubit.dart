import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/network_utils.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repo/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/success_pop_up.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepo authRepo;
  AuthenticationCubit(this.authRepo) : super(AuthenticationInitial());
  static AuthenticationCubit getCubit(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  String passwordPattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$';
  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpUsernameController = TextEditingController();
  final TextEditingController signUpPasswordController = TextEditingController();
  final TextEditingController signUpConfirmPasswordController = TextEditingController();
  final TextEditingController resetPasswordEmailController = TextEditingController();
  final TextEditingController createNewPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  bool isPasswordVisible = true;
  bool newPasswordSuccess = false;
  String otp='';

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthenticationInitial());
  }

  void passwordSuccess() {
    newPasswordSuccess = true;
    emit(AuthenticationInitial());
  }
  void showErrorToast(BuildContext context,String text) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: CustomErrorToast(
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

  /// LOGIN FUNCTION
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      bool result = await NetworkUtils.hasInternetConnection();
      if(result == false){
        emit(LoginFailure(AppStrings.checkYourInternetConnection));
      } else{
        final user = await authRepo.login(email, password);
        if (user != null && user.success == true) {
          await PreferencesHelper.saveToken(token: user.data!.token!);
          await PreferencesHelper.saveUserModel(user);
          print(PreferencesHelper.getToken());
          emit(LoginSuccess(user));
        } else {
          emit(LoginFailure(user?.message ?? 'Invalid credentials or network issues.'));
        }
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
  /// SIGNUP FUNCTION
  Future<void> signUp(String email, String username, String password, String confirmPassword) async {
    emit(SignUpLoading());
    try {
      final user = await authRepo.signUp(email, username,password,confirmPassword);
      if (user != null) {
        emit(SignUpSuccess(user));
      } else {
        emit(SignUpFailure('Invalid credentials or network issues.'));
      }
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }

  /// EMAIL VERIFICATION FUNCTION
  Future<void> emailVerification(String email, String activationOtp) async {
    emit(EmailVerifiedLoading());
    try {
      final user = await authRepo.verifyEmail(email, activationOtp);
      if (user != null) {
        emit(EmailVerifiedSuccess(user));
      } else {
        emit(EmailVerifiedFailure(AppStrings.incorrectCodeOrNetworkIssuesEn));
      }
    } catch (e) {
      emit(EmailVerifiedFailure(e.toString()));
    }
  }

  /// RESET PASSWORD FUNCTION
  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      final user = await authRepo.resetPassword(email);
      if (user != null) {
        emit(ResetPasswordSuccess(user));
      } else {
        emit(ResetPasswordFailure(AppStrings.incorrectEmailOrNetworkIssuesEn));
      }
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }

  /// UPDATE PASSWORD FUNCTION
  Future<void> updatePassword(String otp, String email, String password, String confirmPassword) async {
    emit(UpdatePasswordLoading());
    try {
      final user = await authRepo.updatePassword(otp, email, password, confirmPassword);
      if (user != null) {
        emit(UpdatePasswordSuccess(user));
      } else {
        emit(UpdatePasswordFailure('Invalid credentials'));
      }
    } catch (e) {
      emit(UpdatePasswordFailure(e.toString()));
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
      emit(DeleteAccountFailure(e.toString()));
    }
  }


}

