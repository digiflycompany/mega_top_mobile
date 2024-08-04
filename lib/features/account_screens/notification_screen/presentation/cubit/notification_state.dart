import 'package:mega_top_mobile/features/account_screens/notification_screen/data/models/notification_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final NotificationModel user;

  NotificationSuccess(this.user);
}

class NotificationFailure extends NotificationState {
  final String error;

  NotificationFailure(this.error);
}

class NotificationNoInternetConnection extends NotificationState {}