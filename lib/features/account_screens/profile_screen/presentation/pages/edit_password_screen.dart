import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_password_screen_widgets/confirm_new_password_text_field_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_password_screen_widgets/new_password_text_field_item.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/edit_password_screen_widgets/update_password_button.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.height * 0.089),
        child: PrimaryAppBar(
          AppLocalizations.of(context)!.passwordSettings,
          favour: false,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.066),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NewPasswordTextFieldItem(),
              const ConfirmNewPasswordTextFieldItem(),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: UpdatePasswordButton(formKey: _formKey),
    );
  }
}
