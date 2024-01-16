import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class ForgotPassword extends StatelessWidget {
  final Function()? onTap;
  const ForgotPassword({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            shadowColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.only(left: context.width*0.022),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft
        ),
        child: const Text(
          AppStrings.forgotPasswordEn,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
      ),
    );
  }
}
