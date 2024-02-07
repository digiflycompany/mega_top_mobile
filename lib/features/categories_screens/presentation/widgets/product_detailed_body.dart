import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/about_the_product_column.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_main_description.dart';

class ProductDetailedBody extends StatelessWidget {
  const ProductDetailedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
      child: Column(
        children: [
          const ProductMainDescription(),
          VerticalSpace(context.height*0.04),
          const AboutTheProductColumn(),
          VerticalSpace(context.height*0.04),
        ],
      ),
    );
  }
}
