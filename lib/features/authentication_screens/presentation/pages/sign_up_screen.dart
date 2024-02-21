import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late AuthenticationCubit authenticationCubit;
    authenticationCubit = context.read<AuthenticationCubit>();
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
                  VerticalSpace(context.height * 0.13),
                  const AuthenticationLogo(),
                  VerticalSpace(context.height * 0.055),
                  const AuthenticationTitle(
                    text: AppStrings.createNewAccountEn,
                  ),
                  VerticalSpace(context.height * 0.055),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 0.045),
                    child: Column(
                      children: [
                        const PrimaryTextField(
                          hintText: AppStrings.usernameEn,
                          prefixSvg: AppAssets.usernameIcon,
                        ),
                        VerticalSpace(context.height * 0.033),
                        const PrimaryTextField(
                          hintText: AppStrings.emailEn,
                          prefixSvg: AppAssets.emailSecondIcon,
                        ),
                        VerticalSpace(context.height * 0.033),
                        BlocBuilder<AuthenticationCubit, AuthenticationState>(
                          builder: (context, state) {
                            return const PasswordTextField(
                              hintText: AppStrings.passwordEn,
                              prefixSvg: AppAssets.passwordIcon,
                            );
                          },
                        ),
                        VerticalSpace(context.height * 0.033),
                        BlocBuilder<AuthenticationCubit, AuthenticationState>(
                          builder: (context, state) {
                            return const PasswordTextField(
                              hintText: AppStrings.confirmPasswordEn,
                              prefixSvg: AppAssets.passwordIcon,
                            );
                          },
                        ),
                        VerticalSpace(context.height * 0.055),
                        PrimaryButton(
                          onTap: () {
                            Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
                          },
                          text: AppStrings.signUpEn,
                        ),
                        VerticalSpace(context.height * 0.07),
                        RowTextButton(
                          firstText: AppStrings.alreadyHaveAnAccountEn,
                          buttonText: AppStrings.loginEn,
                          onTap: () {
                            Routes.loginRoute.moveTo;
                          },
                        ),
                        //VerticalSpace(context.height*0.01),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
