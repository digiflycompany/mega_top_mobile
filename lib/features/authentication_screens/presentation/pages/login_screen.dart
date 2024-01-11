import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/skip_text.dart';

import '../../../../core/utils/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SkipText(),
          VerticalSpace(context.height*0.015),
          Image.asset(AppAssets.megaTopLogo,width: context.width*0.4,),
          VerticalSpace(context.height*0.055),
          const Text(
              AppStrings.loginTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
