import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class OTPField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final TextInputAction textInputAction;

  const OTPField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width*0.134,
      height: context.height*0.065,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.otpBoxColor,
          border: Border.all(color: AppColors.otpBoxBorderColor,width: context.width*0.002)
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        textInputAction: textInputAction,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
