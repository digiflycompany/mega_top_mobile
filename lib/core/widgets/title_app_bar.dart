import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  final   String? text;
  const TitleText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style:  TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700
      ),
    );
  }
}
