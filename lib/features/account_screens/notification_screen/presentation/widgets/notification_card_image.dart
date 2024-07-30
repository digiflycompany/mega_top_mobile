import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class NotificationCardImage extends StatelessWidget {
  final String photo;
  const NotificationCardImage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height152,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Image.asset(
        photo,
        fit: BoxFit.fill,
      ),
    );
  }
}
