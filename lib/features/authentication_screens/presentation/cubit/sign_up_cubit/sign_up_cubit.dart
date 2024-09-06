import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repositories/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/email_verification_cubit/email_verification_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/sign_up_email_verification_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial()) {
    initializeControllers();
  }

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

  String? validateConfirmPassword(String value, BuildContext context){
    if (value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseConfirmYourPassword;
    } else if (signUpConfirmPasswordController.text != signUpPasswordController.text) {
      return AppLocalizations.of(context)!.passwordsDoNotMatch;
    }
    return null;
  }

  static SignUpCubit getCubit(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$');


  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpFullNameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
  TextEditingController();

  bool newPasswordSuccess = false;
  bool isPasswordVisible = true;


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

  void handleSignUpState(BuildContext context, SignUpState state){
    if(state is SignUpSuccess){
      Routes.signUpEmailVerificationPageRoute.moveTo;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
  create: (context) => EmailVerificationCubit(AuthRepoImp()),
  child: SignUpEmailVerificationScreen(
           email: signUpEmailController.text,
          ),
),
        ),
      );
    }
    if(state is SignUpFailure){
      showErrorToast(context, AppLocalizations.of(context)!.signUpFailed,state.error);
    }
    if(state is SignUpNoInternetConnection){
      showErrorToast(context, AppLocalizations.of(context)!.signUpFailed,AppLocalizations.of(context)!.noInternetConnectionPleaseTryAgain);
    }
  }
}
