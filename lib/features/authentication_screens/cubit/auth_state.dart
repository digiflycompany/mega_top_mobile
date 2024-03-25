import 'package:mega_top_mobile/features/authentication_screens/data/models/email_verification_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/login_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/sign_up_model.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoginLoading extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {
  final UserModel user;

  LoginSuccess(this.user);
}

class LoginFailure extends AuthenticationState {
  final String error;

  LoginFailure(this.error);
}

class SignUpLoading extends AuthenticationState {}

class SignUpSuccess extends AuthenticationState {
  final SignUpModel user;

  SignUpSuccess(this.user);
}

class SignUpFailure extends AuthenticationState {
  final String error;

  SignUpFailure(this.error);
}


class EmailVerifiedLoading extends AuthenticationState {}

class EmailVerifiedSuccess extends AuthenticationState {
  final EmailVerificationModel emailVerificationModel;

  EmailVerifiedSuccess(this.emailVerificationModel);
}

class EmailVerifiedFailure extends AuthenticationState {
  final String error;

  EmailVerifiedFailure(this.error);
}
