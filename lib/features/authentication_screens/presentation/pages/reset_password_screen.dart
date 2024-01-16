import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_string.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: CustomAppBar(AppStrings.resetPasswordEn)),
    );
  }
}
