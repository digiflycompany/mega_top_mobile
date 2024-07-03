import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_body.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    super.initState();
    authenticationCubit = context.read<AuthenticationCubit>();
    authenticationCubit.emailController.clear();
    authenticationCubit.passwordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state is LoginSuccess){
          PreferencesHelper.saveIsVisitor(isVisitor: true);
          Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
        }
        if(state is LoginFailure){
          authenticationCubit.showErrorToast(context,state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [AppColors.gradientColor, Colors.white],
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      const AuthenticationLogo(),
                      const AuthenticationTitle(
                        text: AppStrings.loginTitleEn,
                      ),
                      const LoginBody(),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    // authenticationCubit.emailController.dispose();
    // authenticationCubit.passwordController.dispose();
    super.dispose();
  }
}
