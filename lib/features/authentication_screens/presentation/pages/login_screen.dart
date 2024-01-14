import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/password_text_feild.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import '../../../../core/utils/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            VerticalSpace(context.height*0.14),
            Image.asset(AppAssets.megaTopLogo,width: context.width*0.35,),
            VerticalSpace(context.height*0.055),
            const AuthenticationTitle(text: AppStrings.loginTitleEn,),
            VerticalSpace(context.height*0.055),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
              child:  Column(
                children: [
                  const PrimaryTextField(
                    hintText: AppStrings.emailEn,
                    prefixSvg: AppAssets.emailSecondIcon,
                  ),
                  VerticalSpace(context.height*0.033),
                  const PasswordTextField(
                    hintText: AppStrings.passwordEn,
                    prefixSvg: AppAssets.passwordIcon,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
