import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';

class ProductPhotoListView extends StatelessWidget {
  final String? photo;
  const ProductPhotoListView({super.key, this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.332,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.height * 0.0065),
        color: AppColors.iconsBackgroundColor,
      ),
      child: Center(
          child: Padding(
        padding: EdgeInsets.only(top: context.height * 0.016),
        child: Image.asset(
          photo!,
          width: context.width * 0.16,
        ),
      )),
    );
  }
}
