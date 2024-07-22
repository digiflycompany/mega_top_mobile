import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repositories/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial()) {
    initializeControllers();
  }

  static SignUpCubit getCubit(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$';
  final emailRegex =
  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpFullNameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
  TextEditingController();

  bool isPasswordVisible = true;
  bool newPasswordSuccess = false;

  void initializeControllers() {
    signUpEmailController = TextEditingController();
    signUpFullNameController = TextEditingController();
    signUpPasswordController = TextEditingController();
    signUpPhoneController = TextEditingController();
    signUpConfirmPasswordController = TextEditingController();
  }

  void disposeControllers() {
    signUpEmailController.dispose();
    signUpFullNameController.dispose();
    signUpPasswordController.dispose();
    signUpPhoneController.dispose();
    signUpConfirmPasswordController.dispose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(SignUpInitial());
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

  Future<void> signUp(String fullName, String phoneNumber, String email,
      String password) async {
    emit(SignUpLoading());
    try {
      final user =
      await authRepo.signUp(fullName, phoneNumber, email, password);
      if (user != null && user.success == true) {
        await PreferencesHelper.saveToken(token: user.data!.token!);
        await PreferencesHelper.saveUserModel(user);
        print(PreferencesHelper.getToken());
        emit(SignUpSuccess(user));
      } else {
        emit(SignUpFailure(
            user?.message ?? 'Invalid credentials or network issues.'));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(SignUpNoInternetConnection());
      } else {
        emit(SignUpFailure(e.toString()));
      }
    }
  }
}
