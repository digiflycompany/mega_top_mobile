import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/account_screen/presentation/pages/user_account_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/create_new_password_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/login_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/reset_password_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/sign_up_or_login_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/sign_up_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/pages/verify_email_screen.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/payment_methods_screen.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/shipping_details_screen.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/pages/category_items_screen.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/pages/category_product_details_screen.dart';
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
  static const String categoryItemsPageRoute = "/category_items_screen";
  static const String signUpOrLoginPageRoute = "/sign_up_or_login_screen";
  static const String categoryProductDetailsPageRoute =
      "/category_product_details_screen";
  static const String shippingDetailsPageRoute = "/shipping_details_screen";
  static const String paymentMethodsPageRoute = "/payment_methods_screen";
  static const String userAccountPageRoute = "/user_account_screen";
}

class RouteGenerator {
  RouteGenerator._internal();
  PageRouteAnimation? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 200.milliseconds;

  static Route<dynamic>? getRoute(RouteSettings routeSettings) {
    debugPrint(routeSettings.name);
    switch (routeSettings.name) {
      case Routes.onBoardingRoute:
        return buildPageRoute(
          child: const OnBoardingScreens(),
        );
      case Routes.loginRoute:
        return buildPageRoute(
          child: const LoginScreen(),
        );
      case Routes.signUpRoute:
        return buildPageRoute(
          child: const SignUpScreen(),
        );
      case Routes.resetPasswordRoute:
        return buildPageRoute(
          child: const ResetPasswordScreen(),
        );
      case Routes.verifyEmailRoute:
        return buildPageRoute(
            child: const VerifyEmailScreen(),
            pageRouteAnimation: PageRouteAnimation.slide);
      case Routes.createNewPasswordRoute:
        return buildPageRoute(
            child: const CreateNewPasswordScreen(),
            pageRouteAnimation: PageRouteAnimation.slide);
      case Routes.homePageRoute:
        return buildPageRoute(
          child: const HomePage(),
        );
      case Routes.searchPageRoute:
        return buildPageRoute(
            child: const SearchPage(), duration: 85.milliseconds);
      case Routes.searchResultPageRoute:
        return buildPageRoute(
            child: const SearchResultPage(),
            pageRouteAnimation: PageRouteAnimation.slide,
            duration: 150.milliseconds);
      case Routes.categoryItemsPageRoute:
        return buildPageRoute(
          child: const CategoryItemsPage(),
        );
      case Routes.categoryProductDetailsPageRoute:
        return buildPageRoute(
          child: const CategoryProductDetailsPage(),
        );
      case Routes.signUpOrLoginPageRoute:
        return buildPageRoute(
          child: const SignUpOrLoginPage(),
        );
      case Routes.shippingDetailsPageRoute:
        return buildPageRoute(
          child: const ShippingDetailsPage(),
        );
      case Routes.paymentMethodsPageRoute:
        return buildPageRoute(
          child: const PaymentMethodsPage(),
        );
      case Routes.userAccountPageRoute:
        return buildPageRoute(
          child: const UserAccountScreen(),
        );
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
            return RotationTransition(
                turns: ReverseAnimation(anim), child: child);
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
    } else {
      return PageRouteBuilder(
        settings: routeSettings,
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      );
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
