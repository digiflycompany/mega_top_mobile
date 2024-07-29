import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final UserModel user;

  NotificationSuccess(this.user);
}

class NotificationFailure extends NotificationState {
  final String error;

  NotificationFailure(this.error);
}

class NotificationNoInternetConnection extends NotificationState {}