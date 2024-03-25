import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repo/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/success_pop_up.dart';
import '../../../core/utils/app_routes.dart';

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
      final user = await authRepo.login(email, password);
      if (user != null) {
        emit(LoginSuccess(user));
      } else {
        emit(LoginFailure('Invalid credentials or network issues.'));
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


}

