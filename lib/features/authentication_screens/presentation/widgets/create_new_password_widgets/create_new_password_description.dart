import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';

class CreateNewPasswordDescription extends StatelessWidget {
  const CreateNewPasswordDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordDescription(
      text: AppStrings.createNewPasswordDescriptionEn,
    );
  }
}
