import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';

class ProductDetailedCategory extends StatelessWidget {
  final String? category;
  const ProductDetailedCategory({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        category!,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: AppColors.greyTextColor,
        ),
      ),
    );
  }
}
