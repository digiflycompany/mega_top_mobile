import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordDescription extends StatelessWidget {
  final String? text;
  const ForgotPasswordDescription({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text!,
        style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: context.width*0.005
        ),
      ),
    );
  }
}
