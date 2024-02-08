import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthenticationTitle extends StatelessWidget {
  final String? text;
  const AuthenticationTitle({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text!,
      style:  TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
