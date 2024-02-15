import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_image.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
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
                VerticalSpace(context.height*0.13),
                const AuthenticationLogo(),
                VerticalSpace(context.height*0.055),
                const AuthenticationTitle(text: AppStrings.loginTitleEn,),
                VerticalSpace(context.height*0.055),
                const LoginBody(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
