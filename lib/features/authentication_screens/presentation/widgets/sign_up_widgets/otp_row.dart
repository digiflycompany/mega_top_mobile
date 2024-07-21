import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/email_verification_cubit/email_verification_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/email_verification_cubit/email_verification_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/otp_text_field.dart';

class OTPEmailVerificationRow extends StatefulWidget {
  final String? Function(String?)? validator;
  const OTPEmailVerificationRow({super.key, this.validator});

  @override
  _OTPEmailVerificationRowState createState() => _OTPEmailVerificationRowState();
}

class _OTPEmailVerificationRowState extends State<OTPEmailVerificationRow> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (_) => TextEditingController());
    focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  void nextField({required String value, required int index}) {
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    } else if (value.length == 1 && index == 3) {
      FocusScope.of(context).unfocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  String getOTP() {
    return controllers.map((controller) => controller.text).join('');
  }

  void clearFields() {
    for (var controller in controllers) {
      controller.clear();
    }
    focusNodes.first.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationResendCodeSuccess) {
          clearFields();
          FocusScope.of(context).requestFocus(focusNodes.first);
        }
      },
      child: BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
        builder: (context, state) {
          AuthenticationCubit otpCubit = context.read<AuthenticationCubit>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return OTPField(
                validator: widget.validator,
                controller: controllers[index],
                focusNode: focusNodes[index],
                onChanged: (value) {
                  nextField(value: value, index: index);
                  otpCubit.otp = getOTP();
                },
                textInputAction:
                    index == 3 ? TextInputAction.done : TextInputAction.next,
              );
            }),
          );
        },
      ),
    );
  }
}
