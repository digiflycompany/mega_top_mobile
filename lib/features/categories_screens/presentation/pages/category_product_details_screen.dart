import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/widgets/add_to_cart_button.dart';
import 'package:mega_top_mobile/core/widgets/product_detailed_image.dart';
import 'package:mega_top_mobile/core/widgets/product_details_app_bar.dart';
import '../../../../core/widgets/status_bar_color.dart';
import '../widgets/product_detailed_body.dart';

class CategoryProductDetailsPage extends StatelessWidget {
  const CategoryProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const CustomStatusBarColor(color: AppColors.onboardingBackgroundColor);

    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const ProductDetailsAppBar()),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ProductDetailedImage(),
            ProductDetailedBody(),
          ],
        ),
      ),
      bottomNavigationBar: const AddToCartButton(),
    );
  }
}
