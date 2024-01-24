import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/create_new_password_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/login_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/reset_password_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/sign_up_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/verify_email_screen.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/home_page_screen.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/search_result_screen.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/search_screen.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_screens.dart';
import 'app_color.dart';
enum PageRouteAnimation { fade, scale, rotate, slide, slideBottomTop }

class Routes {
  Routes._internal();
  static const String onBoardingRoute = "/";
  static const String loginRoute = "/login_screen";
  static const String signUpRoute = "/sign_up_screen";
  static const String resetPasswordRoute = "/reset_password_screen";
  static const String verifyEmailRoute = "/verify_email_screen";
  static const String createNewPasswordRoute = "/create_new_password_screen";
  static const String homePageRoute = "/home_page_screen";
  static const String searchPageRoute = "/search_screen";
  static const String searchResultPageRoute = "/search_result_screen";
}


class RouteGenerator {
  RouteGenerator._internal();
  PageRouteAnimation? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 300.milliseconds;


  static Route<dynamic>? getRoute(RouteSettings routeSettings) {
    debugPrint(routeSettings.name);
    switch (routeSettings.name) {
      case Routes.onBoardingRoute:
        return buildPageRoute(child: const OnBoardingScreens(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.fade );
      case Routes.loginRoute:
        return buildPageRoute(child: const LoginScreen(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.fade);
      case Routes.signUpRoute:
        return buildPageRoute(child: const SignUpScreen(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.fade);
      case Routes.resetPasswordRoute:
        return buildPageRoute(child: const ResetPasswordScreen(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.fade);
      case Routes.verifyEmailRoute:
        return buildPageRoute(child: const VerifyEmailScreen(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.slide);
      case Routes.createNewPasswordRoute:
        return buildPageRoute(child: const CreateNewPasswordScreen(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.slide);
      case Routes.homePageRoute:
        return buildPageRoute(child: const HomePage(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.fade);
      case Routes.searchPageRoute:
        return buildPageRoute(child: const SearchPage(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.fade,duration: 85.milliseconds);
      case Routes.searchResultPageRoute:
        return buildPageRoute(child: const SearchResultPage(), routeSettings: routeSettings,pageRouteAnimation:PageRouteAnimation.slide,duration: 185.milliseconds);
    }
    return buildPageRoute(
        child: const Center(
          child: Text("no route found"),
        ),
        routeSettings: routeSettings);
  }

  static Route<T> buildPageRoute<T>({
    required Widget child,
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
    RouteSettings? routeSettings,
  }) {
    if (pageRouteAnimation != null) {
      if (pageRouteAnimation == PageRouteAnimation.fade) {
        return PageRouteBuilder(
          settings: routeSettings,
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
          reverseTransitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (c, a1, a2) => child,
          transitionsBuilder: (c, anim, a2, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      } else if (pageRouteAnimation == PageRouteAnimation.rotate) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (c, a1, a2) => child,
          transitionsBuilder: (c, anim, a2, child) {
            return RotationTransition(turns: ReverseAnimation(anim), child: child);
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.scale) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (c, a1, a2) => child,
          transitionsBuilder: (c, anim, a2, child) {
            return ScaleTransition(scale: anim, child: child);
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.slide) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (c, a1, a2) => child,
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
              child: child,
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.slideBottomTop) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (c, a1, a2) => child,
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              position: Tween(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
              child: child,
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      }
    }
    return MaterialPageRoute<T>(
      builder: (_) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: child),
      settings: routeSettings,
    );
  }
}
