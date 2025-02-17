import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/login_cubit/login_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit authenticationCubit;
  @override
  void initState() {
    super.initState();
    authenticationCubit = context.read<LoginCubit>();
    authenticationCubit.initializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) =>
            context.read<LoginCubit>().handleLoginStates(context, state),
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                  child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                              colors: [AppColors.gradientColor, Colors.white])),
                      child: Center(
                          child: Column(children: [
                        const AuthenticationLogo(),
                        AuthenticationTitle(
                            text:
                                AppLocalizations.of(context)!.signInToContinue),
                        const LoginBody()
                      ])))));
        });
  }

  @override
  void dispose() {
    authenticationCubit.disposeControllers();
    super.dispose();
  }
}