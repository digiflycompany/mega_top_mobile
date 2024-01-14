import 'package:flutter/material.dart';
import '../../../../core/utils/app_string.dart';

class AuthenticationTitle extends StatelessWidget {
  final String? text;
  const AuthenticationTitle({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text!,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
