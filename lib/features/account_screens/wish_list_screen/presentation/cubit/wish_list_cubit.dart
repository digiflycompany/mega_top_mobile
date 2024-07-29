import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/cubit/wish_list_states.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repositories/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/login_cubit/login_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/custom_error_toast.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class WishListCubit extends Cubit<WishListState> {
  final AuthRepo authRepo;
  WishListCubit(this.authRepo) : super(WishListInitial());

  static WishListCubit getCubit(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;

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

  void handleLoginStates(BuildContext context, LoginState state){
    if (state is LoginSuccess) {
      PreferencesHelper.saveIsVisitor(isVisitor: true);
      Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
    }
    if (state is LoginFailure) {
      showErrorToast(context, AppStrings.loginFailed,state.error);
    }
    if (state is LoginNoInternetConnection) {
      showErrorToast(
          context, AppStrings.loginFailed,AppStrings.noInternetConnectionPlease);
    }
  }
}
