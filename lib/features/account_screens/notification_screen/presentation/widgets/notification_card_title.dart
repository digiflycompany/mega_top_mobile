import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class NotificationCardTitle extends StatelessWidget {
  final String? title;
  const NotificationCardTitle({super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:context.height*0.02),
      child: Container(
        height: context.height32,
        child: FittedBox(
          child: Text(
            title!,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp
            ),
          ),
        ),
      ),
    );
  }
}
