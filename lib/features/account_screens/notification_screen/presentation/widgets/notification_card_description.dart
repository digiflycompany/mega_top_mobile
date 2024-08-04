import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class NotificationCardDescription extends StatelessWidget {
  final String description;
  const NotificationCardDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: context.height32,
      child: FittedBox(
        child: Text(
          description,
          style: TextStyle(
              color: AppColors.notificationDescriptionColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp
          ),
        ),
      ),
    );
  }
}
