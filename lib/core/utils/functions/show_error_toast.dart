import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';

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
        }
      )
    )
  );
  Overlay.of(context).insert(overlayEntry!);
}