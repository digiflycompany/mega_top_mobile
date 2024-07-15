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
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_body.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    super.initState();
    authenticationCubit = context.read<AuthenticationCubit>();
    authenticationCubit.initializeControllers();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state is SignUpSuccess){
          Routes.signUpEmailVerificationPageRoute.moveTo;
        }
        if(state is SignUpFailure){
           authenticationCubit.showErrorToast(context, AppStrings.signUpFailed,state.error);
        }
        if(state is NoInternetConnection){
          authenticationCubit.showErrorToast(context, AppStrings.signUpFailed,AppStrings.noInternetConnectionPlease);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [AppColors.gradientColor, Colors.white],
                  ),
                ),
                child: const Center(
                  child: Column(
                    children: [
                      AuthenticationLogo(),
                      AuthenticationTitle(
                        text: AppStrings.createNewAccountEn,
                      ),
                      SignUpBody(),
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
    authenticationCubit.disposeControllers();
    super.dispose();
  }
}
