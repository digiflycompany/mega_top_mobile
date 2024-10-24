import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/brands/presentation/widgets/brand_product_main_description.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/you_may_also_like_column.dart';

class BrandProductDetailedBody extends StatelessWidget {
  const BrandProductDetailedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: Column(children: [
          const BrandProductMainDescription(),
          VerticalSpace(context.height * 0.04),
          // const AboutTheProductColumn(),
          // VerticalSpace(context.height * 0.04),
          // const ProductSpecificationColumn(),
          // VerticalSpace(context.height * 0.04),
          const YouMayAlsoLikeColumn()
          // VerticalSpace(context.height * 0.04),
        ]));
  }
}