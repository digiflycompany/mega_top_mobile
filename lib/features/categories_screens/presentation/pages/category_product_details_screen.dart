import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/widgets/product_detailed_image.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';

class CategoryProductDetailsPage extends StatelessWidget {
  const CategoryProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const ProductDetailsAppBar()),
      body: const Column(
        children: [
          ProductDetailedImage(),
        ],
      ),
    );
  }
}
