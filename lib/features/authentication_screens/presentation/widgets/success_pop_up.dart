import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/password_pop_up_content.dart';

class NewPasswordPopUp extends StatelessWidget {
  const NewPasswordPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        insetPadding:  EdgeInsets.all(context.width*0.05),
        scrollable: true,
        titlePadding: const EdgeInsets.all(0),
        contentPadding: EdgeInsets.zero,
        content: const PasswordPopUpContent());
  }
}
