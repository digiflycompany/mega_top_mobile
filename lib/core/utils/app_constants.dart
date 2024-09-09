import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/widgets/custom_animated_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppConstants {
  AppConstants._();
  static const double circleRadius = 10;
  static const longDuration = 2500;
  static const shortDuration = 2000;
  static const String qatarDialCode = "+974";
  static  int id = 0;
  static String token ='';
  static const int otpLength = 4;
  static int minIdLength = 10;
  static int maxYears = 20;
  static String dateTimeFormat="yyyy-MM-dd";
  static int nShimmerItems=4;
  static double defaultElevation = 4;
  /* app uses two languages english and arabic */
  static const Locale enLocale = Locale('en', 'US');
  static const Locale arLocale = Locale('ar', 'EG');
  static const List<Locale> supportedLocales = [enLocale, arLocale];
  static String translationPath='assets/translations';

  static void showAddToCompareToast(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayToast(
          message: AppLocalizations.of(context)!.theProductAddedToTheCompareProducts,
          color: AppColors.primaryColor,
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

  static void showFullCompareListToast(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayToast(
          message: AppLocalizations.of(context)!.compareListIsFullUNeedToReduceIt,
          color: AppColors.primaryColor,
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

  static void showRemoveFromCompareToast(BuildContext context) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOverlayToast(
          message: AppLocalizations.of(context)!.productRemovedFromComparisonList,
          color: AppColors.primaryColor,
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
}