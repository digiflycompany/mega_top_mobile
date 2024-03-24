import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/otp_text_field.dart';

class OTPRow extends StatefulWidget {
  @override
  _OTPRowState createState() => _OTPRowState();
}

class _OTPRowState extends State<OTPRow> {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return OTPField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          onChanged: (value) => nextField(value: value, index: index),
          textInputAction: index == 3 ? TextInputAction.done : TextInputAction.next,
        );
      }),
    );
  }
}
