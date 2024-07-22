import 'package:mega_top_mobile/features/account_screens/account_details_screen/data/models/UpdateProfileModel.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/reset_password_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final UserModel userModel;

  ResetPasswordSuccess(this.userModel);
}

class ResetPasswordFailure extends ResetPasswordState {
  final String error;

  ResetPasswordFailure(this.error);
}

class VerifyResetPasswordLoading extends ResetPasswordState {}

class VerifyResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordModel resetPasswordModel;

  VerifyResetPasswordSuccess(this.resetPasswordModel);
}

class VerifyResetPasswordFailure extends ResetPasswordState {
  final String error;

  VerifyResetPasswordFailure(this.error);
}

class UpdatePasswordLoading extends ResetPasswordState {}

class UpdatePasswordSuccess extends ResetPasswordState {
  final UpdateProfileModel updateProfileModel;

  UpdatePasswordSuccess(this.updateProfileModel);
}

class UpdatePasswordFailure extends ResetPasswordState {
  final String error;

  UpdatePasswordFailure(this.error);
}

class ResetPasswordNoInternetConnection extends ResetPasswordState {}

class ResendResetPasswordCodeSuccess extends ResetPasswordState {
  final UserModel userModel;

  ResendResetPasswordCodeSuccess(this.userModel);
}

class ResendResetPasswordCodeLoading extends ResetPasswordState {}

class ResendResetPasswordCodeFailure extends ResetPasswordState {
  final String error;

  ResendResetPasswordCodeFailure(this.error);
}
