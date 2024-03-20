import 'package:mega_top_mobile/features/authentication_screens/data/models/login_model.dart';

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
}

class SignUpFailure extends AuthenticationState {
  final String error;

  SignUpFailure(this.error);
}