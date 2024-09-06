import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/otp_text_field.dart';

class OTPResetPasswordRow extends StatefulWidget {
  final String? Function(String?)? validator;
  const OTPResetPasswordRow({super.key, this.validator});

  @override
  _OTPResetPasswordRowState createState() => _OTPResetPasswordRowState();
}

class _OTPResetPasswordRowState extends State<OTPResetPasswordRow> {
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
    // Force Left-to-Right direction regardless of locale
    return Directionality(
      textDirection: TextDirection.ltr, // Force LTR direction
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
        },
        child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          builder: (context, state) {
            ResetPasswordCubit resetPasswordCubit = context.read<ResetPasswordCubit>();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return OTPField(
                  validator: widget.validator,
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  onChanged: (value) {
                    nextField(value: value, index: index);
                    resetPasswordCubit.otp = getOTP();
                  },
                  textInputAction:
                  index == 3 ? TextInputAction.done : TextInputAction.next,
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
