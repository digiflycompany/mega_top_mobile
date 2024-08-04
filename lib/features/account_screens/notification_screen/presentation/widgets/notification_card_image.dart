import 'package:cached_network_image/cached_network_image.dart';
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
      child: CachedNetworkImage(
        imageUrl: photo,
        //width: photoWidth ?? context.width * 0.16,
        fit: BoxFit.cover,
      ),
    );
  }
}
