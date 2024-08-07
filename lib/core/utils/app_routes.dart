import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/pages/user_account_screen.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/repositories/address_repo.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/cubit/address_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/pages/add_new_address_screen.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/pages/edit_address_details_screen.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/presentation/pages/shipping_addresses_screen.dart';
import 'package:mega_top_mobile/features/account_screens/compare_screen/presentation/pages/compare_screen.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/data/repositories/notification_repo.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/cubit/notification_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/screens/notification_screen.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/pages/order_details_screen.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/pages/order_screen.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/repositories/account_details_repo.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/cubit/account_details_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/pages/edit_password_screen.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/pages/edit_profile_screen.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/pages/profile_screen.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/screens/wish_list_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repositories/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/email_verification_cubit/email_verification_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/create_new_password_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/login_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/reset_password_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/sign_up_email_verification_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/sign_up_or_login_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/sign_up_screen.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/verify_email_screen.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/cart_screen.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/order_confirmation_screen.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/order_summary_screen.dart';
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

  static const String splashRoute = "/";
  static const String onBoardingRoute = "/on_boarding_screens";
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
  static const String orderSummaryPageRoute = "/order_summary_screen";
  static const String userAccountPageRoute = "/user_account_screen";
  static const String orderConfirmationPageRoute = "/order_confirmation_screen";
  static const String profilePageRoute = "/profile_screen";
  static const String profileDetailsPageRoute = "/profile_details_screen";
  static const String passwordDetailsPageRoute = "/password_details_screen";
  static const String deleteAccountPageRoute = "/delete_account_screen";
  static const String addNewAddressPageRoute = "/add_new_address_screen";
  static const String addNewAddressDetailsPageRoute =
      "/add_new_address_details_screen";
  static const String editAddressDetailsPageRoute =
      "/edit_address_details_screen";
  static const String notificationPageRoute = "/notification_screen";
  static const String wishListPageRoute = "/wish_list_screen";
  static const String shippingAddressPageRoute = "/shipping_addresses_screen";
  static const String ordersPageRoute = "/order_screen";
  static const String ordersDetailsPageRoute = "/order_details_screen";
  static const String compareProductPageRoute = "/compare_product_screen";
  static const String signUpEmailVerificationPageRoute = "/sign_up_email_verification_screen";
  static const String cartPageRoute = "/cart_screen";

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
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.loginRoute:
        return buildPageRoute(
            child: BlocProvider(
              create: (context) => LoginCubit(AuthRepoImp()),
              child: LoginScreen(),
            ),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.signUpRoute:
        return buildPageRoute(
            child: BlocProvider(
              create: (context) => SignUpCubit(AuthRepoImp()),
              child: SignUpScreen(),
            ),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.resetPasswordRoute:
        return buildPageRoute(
            child: BlocProvider(
              create: (context) => ResetPasswordCubit(AuthRepoImp()),
              child: ResetPasswordScreen(),
            ),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.verifyEmailRoute:
        final email = routeSettings.arguments as String;
        return buildPageRoute(
            child: BlocProvider(
              create: (context) => ResetPasswordCubit(AuthRepoImp()),
              child: VerifyEmailScreen(email: email,),
            ),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.slide);
      case Routes.createNewPasswordRoute:
        return buildPageRoute(
            child: BlocProvider(
              create: (context) => ResetPasswordCubit(AuthRepoImp()),
              child: CreateNewPasswordScreen(),
            ),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.slide);
      case Routes.homePageRoute:
        return buildPageRoute(
            child: const HomePage(),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.searchPageRoute:
        return buildPageRoute(
            child: const SearchPage(),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade,
            duration: 85.milliseconds);
      case Routes.searchResultPageRoute:
        return buildPageRoute(
            child: const SearchResultPage(),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.slide,
            duration: 150.milliseconds);
      case Routes.categoryItemsPageRoute:
        return buildPageRoute(
            child: const CategoryItemsPage(),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.categoryProductDetailsPageRoute:
        return buildPageRoute(
            child: const CategoryProductDetailsPage(),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.signUpOrLoginPageRoute:
        return buildPageRoute(
            child: const SignUpOrLoginPage(),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.shippingDetailsPageRoute:
        return buildPageRoute(
            child: const ShippingDetailsPage(),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.paymentMethodsPageRoute:
        return buildPageRoute(
            child: const PaymentMethodsPage(),
            routeSettings: routeSettings,
            pageRouteAnimation: PageRouteAnimation.fade);
      case Routes.orderSummaryPageRoute:
        return buildPageRoute(
          child: const OrderSummaryScreen(),
        );
      case Routes.userAccountPageRoute:
        return buildPageRoute(
          child: BlocProvider(
            create: (context) => AccountDetailsCubit(AccountDetailsRepoImp()),
            child: UserAccountScreen(),
          ),
        );
      case Routes.profilePageRoute:
        return buildPageRoute(
          child: ProfileScreen(),
        );
      case Routes.orderConfirmationPageRoute:
        return buildPageRoute(
          child: const OrderConfirmationScreen(),
        );
      case Routes.profileDetailsPageRoute:
        return buildPageRoute(
          child: BlocProvider(
            create: (context) => AccountDetailsCubit(AccountDetailsRepoImp()),
            child: EditProfileScreen(),
          ),
        );
      case Routes.passwordDetailsPageRoute:
        return buildPageRoute(
          child: BlocProvider(
            create: (context) => AccountDetailsCubit(AccountDetailsRepoImp()),
            child: EditPasswordScreen(),
          ),
        );
      case Routes.addNewAddressDetailsPageRoute:
        return buildPageRoute(
          child: const AddNewAddressScreen(),
        );
      case Routes.editAddressDetailsPageRoute:
        return buildPageRoute(
          child: const EditAddressDetailsScreen(),
        );
      case Routes.notificationPageRoute:
        return buildPageRoute(
          child: BlocProvider(
            create: (context) =>
            NotificationCubit(NotificationsRepoImp())
              ..getUserNotification(),
            child: NotificationScreen(),
          ),
        );
      case Routes.wishListPageRoute:
        return buildPageRoute(
          child: BlocProvider(
            create: (context) =>
            AccountDetailsCubit(AccountDetailsRepoImp())
              ..getAccountDetails(),
            child: WishListScreen(),
          ),
        );
      case Routes.shippingAddressPageRoute:
        return buildPageRoute(
          child: BlocProvider(
            create: (context) => AddressCubit(AddressRepoImp())..getUserAddresses(),
            child: ShippingAddressScreen(),
          ),
        );
      case Routes.ordersPageRoute:
        return buildPageRoute(
          child: const OrdersScreen(),
        );
      case Routes.ordersDetailsPageRoute:
        return buildPageRoute(
          child: const OrdersDetailsScreen(),
        );
      case Routes.compareProductPageRoute:
        return buildPageRoute(
          child: const CompareScreen(),
        );
      case Routes.signUpEmailVerificationPageRoute:
        return buildPageRoute(
          child: BlocProvider(
            create: (context) => EmailVerificationCubit(AuthRepoImp()),
            child: SignUpEmailVerificationScreen(),
          ),
        );
      case Routes.cartPageRoute:
        return buildPageRoute(
          child: const CartPage(),
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
      builder: (_) =>
          AnnotatedRegion<SystemUiOverlayStyle>(
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
