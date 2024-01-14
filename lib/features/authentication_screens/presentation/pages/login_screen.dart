import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/authentication_title.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_fonts.dart';

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
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: AppColors.blackGreyColor,
                    cursorHeight: context.width*0.046,
                    decoration: InputDecoration(
                      hintText: AppStrings.emailEn,
                      hintStyle: const TextStyle(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.borderColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth:context.width*0.08),
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppAssets.emailSecondIcon, width: context.width*0.063 , height: context.height*0.026 , fit: BoxFit.scaleDown,),
                        ],
                      ),
                    ),
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
