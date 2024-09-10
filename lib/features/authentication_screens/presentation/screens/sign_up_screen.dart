import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpCubit signUpCubit;
  @override
  void initState() {
    super.initState();
    signUpCubit = context.read<SignUpCubit>();
    signUpCubit.initializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) =>
            context.read<SignUpCubit>().handleSignUpState(context, state),
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
                              colors: [AppColors.gradientColor, Colors.white])),
                      child: Center(
                          child: Column(children: [
                        const AuthenticationLogo(),
                        AuthenticationTitle(
                            text:
                                AppLocalizations.of(context)!.createNewAccount),
                        const SignUpBody()
                      ])))));
        });
  }

  @override
  void dispose() {
    signUpCubit.disposeControllers();
    super.dispose();
  }
}