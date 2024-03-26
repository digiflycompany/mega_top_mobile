import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_condition.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_email_field.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_string.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomAppBar(AppStrings.resetPasswordEn)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ResetPasswordCondition(),
              const ResetPasswordDescription(),
              const ResetPasswordEmailField(),
              PrimaryButton(
                text: AppStrings.sendEn,
                onTap: () {
                  Routes.verifyEmailRoute.moveTo;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
