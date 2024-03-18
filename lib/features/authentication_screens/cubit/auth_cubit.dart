import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = true;

  bool newPasswordSuccess = false;

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
}

