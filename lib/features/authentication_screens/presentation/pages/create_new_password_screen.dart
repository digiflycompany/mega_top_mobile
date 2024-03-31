import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/confirm_new_password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/create_new_password_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/create_new_password_condition.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/create_new_password_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/create_new_password_text_field.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomAppBar(AppStrings.createNewPasswordEn)),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CreateNewPasswordCondition(),
                const CreateNewPasswordDescription(),
                const CreateNewPasswordTextField(),
                const ConfirmNewPasswordTextField(),
                CreateNewPasswordButton(formKey: _formKey,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void passwordChangedSuccessfully(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const NewPasswordPopUp();
  //     },
  //   );
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Navigator.pop(context);
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const LoginScreen(),
  //       ),
  //     );
  //     //Routes.loginRoute.moveToAndRemoveCurrent;
  //   });
  // }
}
