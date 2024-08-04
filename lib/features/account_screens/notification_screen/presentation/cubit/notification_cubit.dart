import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/data/repositories/notification_repo.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/cubit/notification_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationsRepo notificationsRepo;
  NotificationCubit(this.notificationsRepo) : super(NotificationInitial());

  static NotificationCubit getCubit(context) => BlocProvider.of(context);

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

  Future<void> getUserNotification() async {
    emit(NotificationLoading());
    try {
      final user = await notificationsRepo.getUserNotification();
      if (user != null && user.success == true) {
        emit(NotificationSuccess(user));
      } else {
        emit(NotificationFailure(
            user?.message ?? AppStrings.invalidCred));
      }
    } catch (e) {
      if (e is DioException && e.error == AppStrings.noInternetConnection) {
        emit(NotificationNoInternetConnection());
      } else {
        emit(NotificationFailure(e.toString()));
      }
    }
  }

  Future<void> close() {
    return super.close();
  }

}
