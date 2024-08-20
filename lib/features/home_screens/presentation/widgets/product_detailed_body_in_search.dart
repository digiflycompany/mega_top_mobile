import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_main_description.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/you_may_also_like_column_in_search.dart';

class ProductDetailedBodyInSearch extends StatelessWidget {
  const ProductDetailedBodyInSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
      child: Column(
        children: [
          const ProductMainDescription(),
          VerticalSpace(context.height * 0.04),
          // const AboutTheProductColumn(),
          // VerticalSpace(context.height * 0.04),
          // const ProductSpecificationColumn(),
          // VerticalSpace(context.height * 0.04),
           const YouMayAlsoLikeColumnInSearch(),
          // VerticalSpace(context.height * 0.04),
        ],
      ),
    );
  }
}
