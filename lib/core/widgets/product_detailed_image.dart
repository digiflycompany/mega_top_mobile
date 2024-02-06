import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/category_product_images.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_images_dots.dart';
import '../utils/app_color.dart';

class ProductDetailedImage extends StatelessWidget {
  const ProductDetailedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.338,
      decoration: const BoxDecoration(
          color: AppColors.onboardingBackgroundColor
      ),
      child: const Column(
        children: [
          ProductImages(),
          ProductImagesDots(),
        ],
      ),
    );
  }
}