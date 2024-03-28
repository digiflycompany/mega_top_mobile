import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/otp_text_field.dart';

class OTPRow extends StatefulWidget {
  final validator;
  const OTPRow({super.key, this.validator});
  @override
  _OTPRowState createState() => _OTPRowState();
}

class _OTPRowState extends State<OTPRow> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  void nextField({required String value, required int index}) {
    if (value.length == 1 && index < 5) {
      focusNodes[index + 1].requestFocus();
    }

    else if(value.isEmpty && index > 0){
      focusNodes[index-1].requestFocus();
    }
  }

  String getOTP() {
    return controllers.map((controller) => controller.text).join('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit otpCubit = context.read<AuthenticationCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) {
            return OTPField(
              validator: widget.validator,
              controller: controllers[index],
              focusNode: focusNodes[index],
              onChanged: (value) {
                nextField(value: value, index: index);
                otpCubit.otp=getOTP();
              },
              textInputAction: index == 5
                  ? TextInputAction.done
                  : TextInputAction.next,
            );
          }),
        );
      },
    );
  }
}
