import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';

abstract class EmailVerificationState {}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}

class EmailVerificationSuccess extends EmailVerificationState {
  final UserModel user;

  EmailVerificationSuccess(this.user);
}

class EmailVerificationFailure extends EmailVerificationState {
  final String error;

  EmailVerificationFailure(this.error);
}

class EmailVerificationNoInternetConnection extends EmailVerificationState {}

class EmailVerificationResendCodeLoading extends EmailVerificationState {}

class EmailVerificationResendCodeSuccess extends EmailVerificationState {
  final UserModel userModel;

  EmailVerificationResendCodeSuccess(this.userModel);
}

class EmailVerificationResendCodeFailure extends EmailVerificationState {
  final String error;

  EmailVerificationResendCodeFailure(this.error);
}