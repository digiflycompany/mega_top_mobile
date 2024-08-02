import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class ProductPhotoListView extends StatelessWidget {
  final String? photo;
  final double? width;
  final double? photoWidth;
  const ProductPhotoListView({super.key, this.photo, this.width, this.photoWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width * 0.332,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.height * 0.0065),
        color: AppColors.iconsBackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(1.w),
        child: photo != null
            ? CachedNetworkImage(
          imageUrl: photo!,
          width: photoWidth ?? context.width * 0.16,
          fit: BoxFit.cover,
        )
            : Container(), // Or a placeholder if you prefer
      ),
    );
  }
}
