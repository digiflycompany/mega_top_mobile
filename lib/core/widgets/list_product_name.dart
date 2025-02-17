import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListProductName extends StatelessWidget {
  final String? text;
  const ListProductName({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        overflow: TextOverflow.ellipsis,
        text!,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13.sp),
      ),
    );
  }
}
